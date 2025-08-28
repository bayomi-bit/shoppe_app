part of 'contact_info_cubit.dart';

@immutable
sealed class ContactInfoState {}

final class ContactInfoInitial extends ContactInfoState {}

final class ContactInfoLoaded extends ContactInfoState {
  final String email;
  final String phone;


  ContactInfoLoaded(this.email, this.phone);
}
