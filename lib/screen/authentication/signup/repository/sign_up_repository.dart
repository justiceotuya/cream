
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/authentication/signup/model/register_model.dart';
import 'package:flutter/foundation.dart';

class SignUpApiRepository {
  Future<ApiResult<RegisterModel>> signUpUser({@required Map data}) async {
    try {
      final response =
          await dioClient.makePostRequest("user/signup", data: data);
      return ApiResult.success(data: RegisterModel.fromJson(response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
