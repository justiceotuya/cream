import 'package:cream_platform_app/apis/bid/get_bid/model/get_bid_model.dart';
import 'package:cream_platform_app/apis/bid/make_bid/model/make_bid_model.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class MakeBidApiRepository {
  Future<ApiResult<MakeBidModel>> makeBid({@required Map map}) async {
    try {
      final _response = await dioClient.makePostRequest("bid");
      return ApiResult.success(data: MakeBidModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
