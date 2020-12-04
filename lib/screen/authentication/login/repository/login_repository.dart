import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/authentication/login/model/get_token_model.dart';
import 'package:cream_platform_app/screen/authentication/login/model/get_users_data_model.dart';
import 'package:flutter/foundation.dart';

class LoginApiRepository {
  Future<ApiResult<GetUsersDataModel>> loginUser({@required Map data}) async {
    try {
      final _response =
          await dioClient.makePostRequest("user/login", data: data);
      final _token = GetTokenModel.fromJson(_response);
      final _data = await dioClient.makeGetRequest("user/profile",
          options: await getDioHeader(token: _token.data));
      return ApiResult.success(data: GetUsersDataModel.fromJson(_data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
