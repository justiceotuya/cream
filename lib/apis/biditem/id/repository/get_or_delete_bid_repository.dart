import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class GetOrDeleteIDApiRepository {
  Future<ApiResult<dynamic>> getOrDeleteID(
      {@required int id, bool isItDeleteRequest = false}) async {
    try {
      final _response = isItDeleteRequest
          ? await dioClient.makeDeleteRequest("/biditem/:$id",
              options: await getDioHeader(
                  token: PrefManagerProvider?.userData?.token))
          : await dioClient.makeGetRequest("/biditem/:$id",
              options: await getDioHeader(
                  token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
