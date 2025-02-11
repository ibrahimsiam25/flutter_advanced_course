import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final int gender;

  SignupRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}