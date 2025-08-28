
import 'package:shoppe/core/network/api_result.dart';

import 'package:shoppe/features/cart/data/models/cart_request_model.dart';

import 'package:shoppe/features/cart/data/models/cart_response_model.dart';

import '../../../../core/network/Api_constant.dart';
import '../../../../core/network/api_consumer.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements  CartRepository{
  ApiConsumer apiConsumer;

  CartRepositoryImpl(this.apiConsumer);

  @override
  Future<ApiResult<CartResponseModel>> addProductToCart(CartRequestModel cartRequestModel)async {
    try {
      var response = await apiConsumer.post(ApiConstants.addToCart, body: cartRequestModel.toJson());
      return ApiResult.success(CartResponseModel.fromJson(response));
    }catch(e){
      return ApiResult.error(e.toString());
    }
  }

  @override
  Future<ApiResult<CartResponseModel>> getCart(int userId) async{
    try {
      var response =await apiConsumer.get(ApiConstants.getCarts+userId.toString());
      return ApiResult.success(CartResponseModel.fromJson(response));
    }catch(e){
      return ApiResult.error(e.toString());
    }
  }
}