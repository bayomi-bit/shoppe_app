class LoginResponseModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? age;

  LoginResponseModel({  this.firstName,  this.lastName, this.age,this.id});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['id']as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age']  as int?,
    );
  }}