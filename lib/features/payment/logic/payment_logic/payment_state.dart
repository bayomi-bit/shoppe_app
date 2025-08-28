part of 'payment_cubit.dart';

@immutable
 class PaymentState {
  final bool isReadOnly ;
  const PaymentState({  this.isReadOnly = false });
  PaymentState copyWith({bool? isReadOnly})=>PaymentState(isReadOnly: isReadOnly ?? this.isReadOnly);
}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState {}
final class PaymentSuccess extends PaymentState {}
final class PaymentError extends PaymentState {
  final String message;
  const PaymentError({required this.message});
}
