import 'package:cream_platform_app/apis/user/update/model/update_profile_model.dart';
import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class UpdateUsersProfileApiRepository {
  Future<ApiResult<UpdateProfileModel>> updateProfile(
      {@required Map map}) async {
    try {
      final _response = await dioClient.makePutRequest("user/update/profile",
          data: map,
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: UpdateProfileModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
