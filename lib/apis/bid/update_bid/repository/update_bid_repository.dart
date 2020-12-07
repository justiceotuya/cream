import 'package:cream_platform_app/apis/bid/update_bid/model/update_bid_model.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class UpdateBidApiRepository {
  Future<ApiResult<UpdateBidModel>> updateBid(
      {@required int id, @required String status}) async {
    try {
      final _response = await dioClient
          .makePutRequest("bid/update/status/:$id?status=$status");
      return ApiResult.success(data: UpdateBidModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
