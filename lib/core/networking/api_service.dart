import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_constants.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_model.dart';
import 'package:flutter_complete_project/features/login/data/models/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/sign_up/data/models/sign_up_request_model.dart';
import '../../features/sign_up/data/models/sign_up_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponseModel> signup(
    @Body() SignupRequestModel signupRequestBody,
  );
}
