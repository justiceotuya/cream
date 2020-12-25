import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/authentication/forgot_password/repository/forgot_password_repository.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final ForgotPasswordApiRepository _repository = ForgotPasswordApiRepository();

class ForgotPasswordProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void forgotPassword({@required String phoneNumber}) async {
    try {
      _progressIndicator.show();
      final _response =
          await _repository.forgotPassword(phoneNumber: phoneNumber);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
        PageRouter.gotoNamed(Routes.FORGOT_PASSWORD, _context,
            clearStack: true);
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
