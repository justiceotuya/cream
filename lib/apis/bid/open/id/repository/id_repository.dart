import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class OpenNumberBidApiRepository {
  Future<ApiResult<dynamic>> winner({
    @required int id,
    @required String date,
    @required String period,
  }) async {
    try {
      final _response = await dioClient
          .makePutRequest("bid/open/$id?date=$date&period=$period");
      return ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
