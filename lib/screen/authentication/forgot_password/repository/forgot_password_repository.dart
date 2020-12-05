import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/authentication/forgot_password/model/forgot_password_model.dart';
import 'package:flutter/foundation.dart';

class ForgotPasswordApiRepository {
  Future<ApiResult<ForgotPasswordModel>> forgotPassword(
      {@required String phoneNumber}) async {
    try {
      final _response = await dioClient
          .makePostRequest("user/password/forgot/$phoneNumber");
      return ApiResult.success(data: ForgotPasswordModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
