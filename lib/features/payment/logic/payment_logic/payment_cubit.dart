import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shoppe/features/payment/data/rebo/payment_repository.dart';

import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/helpers/location_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentRepository paymentRepository ;

  PaymentCubit(this.paymentRepository) : super(PaymentInitial());


  final userId = CashHelper.getId();




  Future makePayment(int amount,String currency)async{
    emit(PaymentLoading());

    try{
      var result = await paymentRepository.createPaymentIntent(amount*100, currency);

      if(result.isSuccess){
        await paymentRepository.initPaymentSheet(result.data!.clientSecret!);
        await paymentRepository.showPaymentSheet();
        emit(PaymentSuccess());
      }
    }catch(e){
      emit(PaymentError(message: e.toString()));
    }
    }




}
