import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class FindBidStatusFindApiRepository {
  Future<ApiResult<dynamic>> findBidStatusFind(
      {@required int page, @required int size, @required String status}) async {
    try {
      final _response = await dioClient.makeGetRequest(
          "biditem/find?page=$page&size=$size&status=$status",
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
