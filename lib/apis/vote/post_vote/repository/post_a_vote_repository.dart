import 'package:cream_platform_app/apis/vote/post_vote/model/vote_model.dart';
import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class PostAVoteApiRepository {
  Future<ApiResult<PostAVoteModel>> vote(
      {@required Map map}) async {
    try {
      final _response = await dioClient.makePostRequest("vote",
          data: map,
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: PostAVoteModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
