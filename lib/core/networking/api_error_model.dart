import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errorsMap;
  ApiErrorModel({
    this.message,
    this.code,
    this.errorsMap,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  String getAllMessages() {
    if(errorsMap.isNullOrEmpty()){
      return message??"unknown error occured";
    }
      final errorMessage = errorsMap!.entries.map((entry){
    final value = entry.value;
    return "${value.join(", ")}";

  }).join("\n ");
    return errorMessage;
  }

  

}