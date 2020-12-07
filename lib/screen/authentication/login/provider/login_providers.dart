import 'package:cream_platform_app/common/pref_manager_provider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/helper/route.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/resources/string_resources.dart';
import 'package:cream_platform_app/screen/authentication/login/model/get_users_data_model.dart';
import 'package:cream_platform_app/screen/authentication/login/repository/login_repository.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final LoginApiRepository _repository = LoginApiRepository();

class LoginProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void loginUser({@required Map map, @required bool keepMeSignedIn}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.loginUser(data: map);
      _response.when(success: (GetUsersDataModel success) async {
        await _progressIndicator.dismiss();
        preferencesHelper.saveValue(
            key: AppString.keepMeSignedIn, value: keepMeSignedIn);
        pushReplace(context: _context, child: MyHomePage(bottomNavIndex: 8));
        PrefManagerProvider.getData();
      }, failure: (NetworkExceptions error) async {
        await _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
    } catch (e) {
      await _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }
}
