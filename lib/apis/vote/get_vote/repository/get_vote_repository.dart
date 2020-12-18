import 'package:cream_platform_app/apis/vote/get_vote/model/get_vote_model.dart';
import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class GetVoteApiRepository {
  Future<ApiResult<GetVoteModel>> getAllPosts(
      {@required int page, int size = 20}) async {
    try {
      final _response = await dioClient.makeGetRequest(
          "vote/all?page=$page&size=$size",
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: GetVoteModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
