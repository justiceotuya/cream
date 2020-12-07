import 'package:cream_platform_app/apis/bid/model/bid_model.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class BidApiRepository {
  Future<ApiResult<BidModel>> bid({@required Map data}) async {
    try {
      final _response =
          await dioClient.makePostRequest("user/login", data: data);
      return ApiResult.success(data: BidModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
