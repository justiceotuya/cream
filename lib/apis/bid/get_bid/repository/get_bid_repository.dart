import 'package:cream_platform_app/apis/bid/get_bid/model/get_bid_model.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class GetBidApiRepository {
  Future<ApiResult<GetBidModel>> getAllBids(
      {@required int page, @required int size}) async {
    try {
      final _response =
          await dioClient.makeGetRequest("bid/all?page=$page&size=$size");
      return ApiResult.success(data: GetBidModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
