import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class WinnerBidApiRepository {
  Future<ApiResult<dynamic>> winner({
    @required int id,
  }) async {
    try {
      final _response = await dioClient.makePutRequest("/bid/winner/:$id?");
      return ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
