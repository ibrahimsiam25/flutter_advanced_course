import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  SignupResponseModel({this.message, this.userData, this.status, this.code});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.token, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}