import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../data/models/register_request_model.dart';
import '../data/models/register_response_model.dart';
import '../data/rebo/register_rebository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository registerRepository;

  RegisterCubit(this.registerRepository) : super(RegisterInitial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if(!formKey.currentState!.validate())return;

    try {
      emit(RegisterLoading());



      var response = await registerRepository.register(
        RegisterRequestModel(
          firstName: firstNameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (response.isSuccess) {
        emit(RegisterSuccess(registerResponseModel: response.data!));
      } else {
        emit(RegisterError(message: response.error!));
      }
    } catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
