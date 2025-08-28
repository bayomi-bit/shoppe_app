part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressLoaded extends AddressState {
  final String address;
  final double latitude;
  final double longitude;

  AddressLoaded(this.address, this.latitude, this.longitude);
}

final class AddressError extends AddressState {
  final String message;
  AddressError(this.message);
}
