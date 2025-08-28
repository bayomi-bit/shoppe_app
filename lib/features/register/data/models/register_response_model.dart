class RegisterResponseModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? age;

  RegisterResponseModel({  this.firstName,  this.lastName, this.age,this.id});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      id: json['id']as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age']  as int?,
    );
  }}