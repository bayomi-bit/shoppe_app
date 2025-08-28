import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/cash_helper.dart';
import '../../data/rebo/payment_repository.dart';
import '../payment_logic/payment_cubit.dart';

part 'contact_info_state.dart';

class ContactInfoCubit extends Cubit<ContactInfoState> {
  PaymentRepository paymentRepository ;

  ContactInfoCubit(this.paymentRepository) : super(ContactInfoInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final userId = CashHelper.getId();


  getContactInfo(){

    final email = CashHelper.getString("email$userId") ?? "";
    final phone = CashHelper.getString("phone$userId") ?? "";

    emailController.text = "   $email";
    phoneController.text = "   $phone";

    emit(ContactInfoLoaded( email, phone));
  }
}
