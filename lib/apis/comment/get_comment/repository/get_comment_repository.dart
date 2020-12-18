import 'package:cream_platform_app/apis/bid/get_bid/model/get_bid_model.dart';
import 'package:cream_platform_app/apis/comment/get_comment/model/get_comment_model.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class GetCommentApiRepository {
  Future<ApiResult<GetCommentModel>> getAllComments(
      {@required int id, @required int page, int size = 20}) async {
    try {
      final _response = await dioClient
          .makeGetRequest("comment/content/:$id?page=$page&size=$size");
      return ApiResult.success(data: GetCommentModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
