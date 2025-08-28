import 'package:shoppe/core/network/Api_constant.dart';
import 'package:shoppe/core/network/api_consumer.dart';
import 'package:shoppe/core/network/api_result.dart';
import 'package:shoppe/features/register/data/models/register_request_model.dart';
import 'package:shoppe/features/register/data/models/register_response_model.dart';
import 'package:shoppe/features/register/data/rebo/register_rebository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final ApiConsumer apiConsumer;

  RegisterRepositoryImpl(this.apiConsumer);

  @override
  Future<ApiResult<RegisterResponseModel>> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      var response = await apiConsumer.post(
        ApiConstants.register,
        body: registerRequestModel.toJson(),
      );
      return ApiResult.success(RegisterResponseModel.fromJson(response));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
