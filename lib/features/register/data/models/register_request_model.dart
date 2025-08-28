class RegisterRequestModel {
  final String firstName;
  final String email;
  final String password;
  RegisterRequestModel({required this.firstName, required this.email,required this.password});
  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'email': email,
    'password': password,
  };
}