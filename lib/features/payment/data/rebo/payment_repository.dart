import 'package:shoppe/core/network/api_result.dart';
import 'package:shoppe/features/payment/data/models/payment_intent_response.dart';

abstract class PaymentRepository {
  Future<ApiResult<PaymentIntentResponse>> createPaymentIntent(int amount, String currency);

  Future<void> initPaymentSheet(String paymentIntentClientSecret);

  Future<void> showPaymentSheet();
  Future<String>getAddressFromLocation(double latitude,double longitude);


}