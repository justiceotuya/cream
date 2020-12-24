import 'package:cream_platform_app/apis/content/personal/model/toggle_visibility_model.dart';
import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class ToggleVisibilityApiRepository {
  Future<ApiResult<ToggleVisibilityModel>> toggle({@required int id}) async {
    try {
      final _response = await dioClient.makeGetRequest("content/public/$id",
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: ToggleVisibilityModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
