import 'package:cream_platform_app/apis/user/password/repository/change_password_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final ChangePasswordApiRepository _repository = ChangePasswordApiRepository();

class ChangePasswordProvider with ChangeNotifier {
  bool autoValidate = false;
  bool hideOldPassword = true;
  bool newOldPassword = true;
  bool confirmNewPassword = true;
  String gender;
  String state;

  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void changePassword({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.changePassword(map: map);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
        showCircleDialogBox(
            context: _context, content: 'Password\nSuccessfully\nUpdated');
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

  void toggleAutoValidate(bool validate) {
    autoValidate = validate;
    notifyListeners();
  }

  void toggleOldPasswordVisibility() {
    hideOldPassword = !hideOldPassword;
    notifyListeners();
  }

  void toggleNewPasswordVisibility() {
    newOldPassword = !newOldPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    confirmNewPassword = !confirmNewPassword;
    notifyListeners();
  }
}
