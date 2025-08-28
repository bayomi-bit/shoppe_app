import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shoppe/core/helpers/cash_helper.dart';
import 'package:shoppe/features/cart/data/data_source/cart_request_hive.dart';
import 'package:shoppe/features/cart/data/data_source/product_hive.dart';
import 'package:shoppe/features/cart/data/models/cart_response_model.dart';
import 'package:shoppe/features/cart/data/rebo/cart_repository.dart';
import '../../home/data/models/product_response_model.dart';
import '../data/models/cart_request_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;
  Box<CartRequestHive>? cartBox;

  CartCubit(this.cartRepository) : super(CartInitial()) {
    init();
  }

  /// Init & Load Cart
  Future<void> init() async {
    cartBox = await Hive.openBox<CartRequestHive>('cart');

    final savedCart = cartBox?.get('cart');
    if (savedCart != null && savedCart.products.isNotEmpty) {
      _sendCart(_mapHiveToRequest(savedCart));
    } else {
      _emitEmpty();
    }
  }


  Future<void> addProductToCart(Product product) async {
    emit(CartLoading());

    final currentCart = _getOrCreateCart();
    final existing = currentCart.products.firstWhere(
      (p) => p.id == product.id,
      orElse: () => ProductsHive(id: -1, quantity: 0),
    );

    if (existing.id != -1) {
      existing.quantity = (existing.quantity ?? 0) + 1;
    } else {
      currentCart.products.add(ProductsHive(id: product.id!, quantity: 1));
    }

    await _saveCart(currentCart);
  }

  Future<void> removeProductFromCart(int productId) async {
    final currentCart = _getCartOrNull();
    if (currentCart == null) return _emitEmpty();

    currentCart.products.removeWhere((p) => p.id == productId);
    await _saveCart(currentCart);
  }

  Future<void> quantityMinus(int productId) async {
    final currentCart = _getCartOrNull();
    if (currentCart == null) return _emitEmpty();

    final product = currentCart.products.firstWhere((p) => p.id == productId);
    product.quantity = (product.quantity ?? 0) - 1;

    if (product.quantity == 0) {
      currentCart.products.removeWhere((p) => p.id == productId);
    }

    await _saveCart(currentCart);
  }

  Future<void> quantityPlus(int productId) async {
    final currentCart = _getCartOrNull();
    if (currentCart == null) return _emitEmpty();

    final product = currentCart.products.firstWhere((p) => p.id == productId);
    product.quantity = (product.quantity ?? 0) + 1;

    await _saveCart(currentCart);
  }

  /// -------------------------------
  /// Helpers
  /// -------------------------------
  CartRequestHive _getOrCreateCart() {
    return cartBox?.get('cart') ??
        CartRequestHive(userId: CashHelper.getId()!, products: []);
  }

  CartRequestHive? _getCartOrNull() {
    final cart = cartBox?.get('cart');
    if (cart == null || cart.products.isEmpty) return null;
    return cart;
  }

  Future<void> _saveCart(CartRequestHive cart) async {
    await cartBox?.put('cart', cart);

    final request = _mapHiveToRequest(cart);
    if (request.products!.isEmpty) {
      _emitEmpty();
    } else {
      _sendCart(request);
    }
  }

  CartRequestModel _mapHiveToRequest(CartRequestHive cart) {
    return CartRequestModel(
      userId: cart.userId,
      products: cart.products
          .map((p) => ProductsRequest(id: p.id, quantity: p.quantity ?? 1))
          .toList(),
    );
  }

  Future<void> _sendCart(CartRequestModel request) async {
    final result = await cartRepository.addProductToCart(request);

    if (result.isSuccess) {
      emit(CartSuccess(cartResponseModel: result.data!));
    } else {
      emit(CartError(message: result.error!));
    }
  }

  void _emitEmpty() => emit(CartEmpty());
}
