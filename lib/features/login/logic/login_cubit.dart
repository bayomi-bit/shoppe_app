import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shoppe/core/helpers/cash_helper.dart';
import 'package:shoppe/features/login/data/repo/login_rebository.dart';

import '../data/models/login_request_model.dart';
import '../data/models/login_response_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository   ;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginCubit (this.loginRepository) : super(LoginInitial());

  Future<void> login()async{
    if(!formKey.currentState!.validate())return;

    try {
      emit(LoginLoading());
      var response = await loginRepository.login(
        LoginRequestModel(
          username: usernameController.text,
          password: passwordController.text,
        ),
      );
      if (response.isSuccess) {
        CashHelper.setId(response.data!.id!);
        emit(LoginSuccess(loginResponseModel: response.data!));
      } else {
        emit(LoginError(message: response.error!));
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }




}
