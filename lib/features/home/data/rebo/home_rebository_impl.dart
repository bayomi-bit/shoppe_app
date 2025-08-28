import 'package:shoppe/core/network/api_consumer.dart';
import 'package:shoppe/core/network/api_result.dart';

import 'package:shoppe/features/home/data/models/product_response_model.dart';

import '../../../../core/network/Api_constant.dart';
import 'home_rebository.dart';

class HomeRepositoryImpl extends HomeRepository {
  ApiConsumer apiConsumer;

  HomeRepositoryImpl(this.apiConsumer);
  // implement categories
  @override
  Future<ApiResult<List<String>>> getCategories() async {
    try {
      var response = await apiConsumer.get(ApiConstants.categoryList);
      return ApiResult.success(List<String>.from(response));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
  // implement products
  @override
  Future<ApiResult<ProductResponseModel>> getProductByCategories(
    String category,
  ) async {
    try {
      var response = await apiConsumer.get(ApiConstants.products + category);
      return ApiResult.success(ProductResponseModel.fromJson(response));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
 // search
  @override
  Future<ApiResult<ProductResponseModel>> searchProduct(String query) async {
    try {
      var response = await apiConsumer.get(ApiConstants.search + query);
      return ApiResult.success(ProductResponseModel.fromJson(response));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
