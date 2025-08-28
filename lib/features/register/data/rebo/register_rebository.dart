import 'package:shoppe/core/network/api_result.dart';
import 'package:shoppe/features/register/data/models/register_response_model.dart';

import '../models/register_request_model.dart';

abstract class RegisterRepository {

  Future<ApiResult<RegisterResponseModel>> register(RegisterRequestModel registerRequestModel);
}