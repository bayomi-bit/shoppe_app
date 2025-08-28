part of 'profile_cubit.dart';

@immutable
 class ProfileState {
  final bool isReadOnly;

  const ProfileState({required this.isReadOnly});
  ProfileState copyWith({bool? isReadOnly}) => ProfileState(isReadOnly: isReadOnly ?? this.isReadOnly);
}

