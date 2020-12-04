import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/route.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/authentication/login/login_page.dart';
import 'package:cream_platform_app/screen/authentication/signup/model/register_model.dart';
import 'package:cream_platform_app/screen/authentication/signup/repository/sign_up_repository.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final SignUpApiRepository _repository = SignUpApiRepository();

class SignUpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void signUpUser({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.signUpUser(data: map);
      _response.when(success: (RegisterModel success) async {
        await _progressIndicator.dismiss();
        showToast(_context, message: success?.message);
        pushReplace(context: _context, child: LoginPage());
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
