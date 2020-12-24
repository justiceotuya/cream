import 'package:cream_platform_app/apis/content/personal/model/content_history_model.dart';
import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';

class ContentHistoryApiRepository {
  Future<ApiResult<ContentHistoryModel>> history(
      {@required int page}) async {
    try {
      final _response = await dioClient.makeGetRequest(
          "content/personal?page=$page&size=5",
          options:
              await getDioHeader(token: PrefManagerProvider?.userData?.token));
      return ApiResult.success(data: ContentHistoryModel.fromJson(_response));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
