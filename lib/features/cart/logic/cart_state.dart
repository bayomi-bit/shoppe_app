part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartEmpty extends CartState {}

final class CartSuccess extends CartState {
  final CartResponseModel cartResponseModel;

  CartSuccess({required this.cartResponseModel});
}

final class CartError extends CartState {
  final String message;

  CartError({required this.message});
}
