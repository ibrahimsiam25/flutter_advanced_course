import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String? message;
  @JsonKey(name: 'data')// Maps the "data" key in JSON to the userData property in Dart
  UserData? userData;
  bool? status;
  int? code;

  LoginResponseModel({this.message, this.userData, this.status, this.code});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')//Maps the "username" key in JSON to userName in Dart
  String? userName;

  UserData({this.token, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
