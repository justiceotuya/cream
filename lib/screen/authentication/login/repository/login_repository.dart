import 'package:cream_platform_app/data/model/user_data_model.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/network/api_result.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/resources/string_resources.dart';
import 'package:cream_platform_app/screen/authentication/login/model/get_token_model.dart';
import 'package:cream_platform_app/screen/authentication/login/model/get_users_data_model.dart';
import 'package:flutter/foundation.dart';

class LoginApiRepository {
  Future<ApiResult<GetUsersDataModel>> loginUser({@required Map data}) async {
    try {
      final _response =
          await dioClient.makePostRequest("user/login", data: data);
      final _token = GetTokenModel.fromJson(_response);
      final _data = await dioClient.makeGetRequest("user/profile",
          options: await getDioHeader(token: _token.data));
      final _finalData = GetUsersDataModel.fromJson(_data);

      _saveUsersData(_finalData, _token.data);
      return ApiResult.success(data: _finalData);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  void _saveUsersData(GetUsersDataModel getUsersDataModel, String token) async {
    UserDataModel _userDataModel = UserDataModel(
        id: getUsersDataModel?.data?.id ?? '',
        token: token ?? '',
        firstName: getUsersDataModel?.data?.firstName ?? '',
        lastName: getUsersDataModel?.data?.lastName ?? '',
        phone: getUsersDataModel?.data?.phone ?? '',
        email: getUsersDataModel?.data?.email ?? '',
        sex: getUsersDataModel?.data?.sex ?? '',
        address: getUsersDataModel?.data?.address ?? '',
        state: getUsersDataModel?.data?.state ?? '',
        type: getUsersDataModel?.data?.type ?? '',
        status: getUsersDataModel?.data?.status ?? '');
    preferencesHelper.saveValue(
        key: AppString.usersPrefKey,
        value: UserDataModel.toJson(_userDataModel));
  }
}
