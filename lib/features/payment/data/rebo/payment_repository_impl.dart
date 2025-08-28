
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shoppe/core/network/Api_constant.dart';
import 'package:shoppe/core/network/api_consumer.dart';
import 'package:shoppe/core/network/api_result.dart';
import 'package:shoppe/features/payment/data/models/payment_intent_response.dart';
import 'package:shoppe/features/payment/data/rebo/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository{
  ApiConsumer apiConsumer;
  PaymentRepositoryImpl(this.apiConsumer);
  @override
  Future<ApiResult<PaymentIntentResponse>> createPaymentIntent(int amount, String currency) async{

    try {
      var response = await apiConsumer.post(ApiConstants.stripeUrl,
          body: {
            'amount': amount,
            'currency': currency
          },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer ${ApiConstants.secretKey}'}
        )




      );

      return ApiResult.success(PaymentIntentResponse.fromJson(response));

    }catch(e){
      return ApiResult.error(e.toString());
    }

  }

  @override
  Future<void> initPaymentSheet(String paymentIntentClientSecret) async{
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: 'Shoppe'
        )
    );
  }

  @override
  Future<void> showPaymentSheet() async{
   await Stripe.instance.presentPaymentSheet();
  }

  @override
  Future<String> getAddressFromLocation(double latitude, double longitude)async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placeMarks[0];

      return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      return "No address available";
    }
  }
}