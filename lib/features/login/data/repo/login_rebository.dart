import 'package:shoppe/core/network/api_result.dart';

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';


abstract class LoginRepository {

  Future<ApiResult<LoginResponseModel>> login(LoginRequestModel loginRequestModel);
}