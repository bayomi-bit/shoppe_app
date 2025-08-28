import 'package:shoppe/core/network/api_result.dart';
import 'package:shoppe/features/cart/data/models/cart_request_model.dart';
import 'package:shoppe/features/cart/data/models/cart_response_model.dart';

abstract class CartRepository {

  Future<ApiResult<CartResponseModel>> addProductToCart(CartRequestModel cartRequestModel);
  Future<ApiResult<CartResponseModel>> getCart(int userId);
}