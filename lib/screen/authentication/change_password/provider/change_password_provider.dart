import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/authentication/change_password/repository/change_password_repository.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final ChangePasswordApiRepository _repository = ChangePasswordApiRepository();

class ChangePasswordProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  bool isOldPasswordVisible = false;
  bool isOldPasswordIconVisible = false;
  bool isNewPasswordVisible = false;
  bool isNewPasswordIconVisible = false;
  bool newPasswordError = false;
  bool confirmNewPasswordError = false;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  bool verifyPassword(String newPassword, String confirmNewPassword) {
    if (!isPasswordCompliant(newPassword)) {
      newPasswordError = true;
      notifyListeners();
      return false;
    }
    if (!isPasswordCompliant(confirmNewPassword)) {
      confirmNewPasswordError = true;
      notifyListeners();
      return false;
    }
    return true;
  }

  void changePassword({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.changePassword(data: map);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
        showCircleDialogBox(
            context: _context,
            content: success?.message ?? 'Password\nSuccessfully\nUpdated');
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

  void toggleOldPassword() {
    isOldPasswordVisible = !isOldPasswordVisible;
    isOldPasswordIconVisible = !isOldPasswordIconVisible;
    notifyListeners();
  }

  void toggleNewPassword() {
    isNewPasswordVisible = !isNewPasswordVisible;
    isNewPasswordIconVisible = !isNewPasswordIconVisible;
    notifyListeners();
  }
}
