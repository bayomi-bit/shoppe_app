import 'package:bloc/bloc.dart';
import "package:meta/meta.dart";
import '../../../core/helpers/cash_helper.dart';
import '../../home/data/models/product_response_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  Future<void> addFavorite(Product product) async {
    await CashHelper.setFavorite(product);
    await getFavorite();
  }

  Future<void> getFavorite() async {
    emit(FavoritesLoading());
    try {
      final favoriteProduct = await CashHelper.getFavorites();
      emit(FavoritesLoaded(products: favoriteProduct));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> removeFavorite(Product product) async {
    await CashHelper.removeFavorite(product);
    await getFavorite();
  }

  Future toggleFavorite(Product product) async {
    if (await CashHelper.isFavorite(product.id!)) {
      await removeFavorite(product);
    } else {
      await addFavorite(product);
    }
    await getFavorite();
  }

  Future<bool> isFavorite(int productId) async {
    final isFavorite = await CashHelper.isFavorite(productId);
    return isFavorite;
  }
}
