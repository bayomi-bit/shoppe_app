import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shoppe/core/helpers/cash_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(isReadOnly: true));
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final userId = CashHelper.getId();

  void toggleEdit() => emit(state.copyWith(isReadOnly: !state.isReadOnly));

  Future saveProfile() async {
    CashHelper.saveString("name$userId", nameController.text);
    CashHelper.saveString("email$userId", emailController.text);
    CashHelper.saveString("phone$userId", phoneController.text);

    emit(state.copyWith(isReadOnly: true));
  }

  void getProfile() {
    nameController.text = (CashHelper.getString("name$userId")) ?? "Full Name";
    emailController.text = (CashHelper.getString("email$userId")) ?? "Email";
    phoneController.text = (CashHelper.getString("phone$userId")) ?? "Phone";
  }
}
