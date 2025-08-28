import 'package:shoppe/core/network/api_result.dart';
import 'package:shoppe/features/home/data/models/category_response_model.dart';

import '../models/product_response_model.dart';
abstract class HomeRepository {
  Future<ApiResult<List<String>>> getCategories();
  Future<ApiResult<ProductResponseModel>> getProductByCategories(String category);
  Future <ApiResult<ProductResponseModel>> searchProduct(String query);
}
