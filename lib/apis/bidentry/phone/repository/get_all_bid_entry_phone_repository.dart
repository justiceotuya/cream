import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class GetAllBidEntryPhoneApiRepository {
  Future<ApiResult<dynamic>> getAllBidEntryPhone(
      {@required int page, @required String phone, @required int size}) async {
    try {
      final _response = await dioClient.makeGetRequest(
          "bidentry/phone?page=$page&phone=$phone&size=$size",
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
