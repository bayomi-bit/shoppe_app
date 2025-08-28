import 'package:shoppe/core/network/api_consumer.dart';
import 'package:shoppe/core/network/api_result.dart';

import 'package:shoppe/features/login/data/models/login_request_model.dart';

import 'package:shoppe/features/login/data/models/login_response_model.dart';

import '../../../../core/network/Api_constant.dart';
import 'login_rebository.dart';

class LoginRepositoryImpl extends LoginRepository {
  ApiConsumer apiConsumer;

  LoginRepositoryImpl(this.apiConsumer);

  @override
  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      var response = await apiConsumer.post(
        ApiConstants.login,
        body: loginRequestModel.toJson(),
      );
      return ApiResult.success(LoginResponseModel.fromJson(response));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
