import 'package:cream_platform_app/data/model/user_data_model.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/resources/string_resources.dart';
import 'package:flutter/cupertino.dart';

class PrefManagerProvider extends ChangeNotifier {
  static UserDataModel userData;

  static Future<void> getData() async {
    if (await preferencesHelper.doesExists(key: AppString.usersPrefKey)) {
      final _data =
          await preferencesHelper.getCachedData(key: AppString.usersPrefKey);
      userData = UserDataModel.fromJson(_data);
    }
  }
}
