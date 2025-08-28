part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterError extends RegisterState {
  final String message;
  RegisterError({required this.message});
}

final class RegisterSuccess extends RegisterState {
  final RegisterResponseModel registerResponseModel;
  RegisterSuccess({required this.registerResponseModel});
}