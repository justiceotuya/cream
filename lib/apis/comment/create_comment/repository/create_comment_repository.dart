import 'package:cream_platform_app/apis/comment/create_comment/model/create_comment_model.dart';
import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class CreateCommentApiRepository {
  Future<ApiResult<CreateCommentModel>> createComment(
      {@required int id, @required Map map}) async {
    try {
      final _response = await dioClient.makePostRequest("comment/content/:$id",
          data: map,
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: CreateCommentModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
