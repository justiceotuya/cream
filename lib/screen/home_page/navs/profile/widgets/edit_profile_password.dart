import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/authentication/change_password/model/change_password_model.dart';
import 'package:cream_platform_app/screen/authentication/change_password/provider/change_password_provider.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_without_border_edit_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPassword extends StatelessWidget {
  final VoidCallback togglePasswordCallback;
  bool isObsecure;
  bool toggledPasswordIcon;

  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();

  EditPassword(
      {@required this.togglePasswordCallback,
      this.isObsecure = false,
      this.toggledPasswordIcon = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordProviders>(
        builder: (_, changePassword, __) => Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: FloatingNoBorderEditTextWidget(
                        controller: _newPasswordController,
                        err:
                            'invalid password format!',
                        hint: 'Enter old password',
                        togglePassword: changePassword.isOldPasswordIconVisible,
                        isValidationError: changePassword.newPasswordError,
                        togglePasswordCallback: () =>
                            changePassword.toggleOldPassword(),
                        isPassword: true,
                        obsecure: changePassword.isOldPasswordVisible,
                        iconSize: 20,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: textColor6,
                          fontWeight: FontWeight.normal,
                        ),
                        textInputType: TextInputType.text,
                      )),
                      SizedBox(
                        width: 31,
                      ),
                      Expanded(
                          child: FloatingNoBorderEditTextWidget(
                        controller: _confirmNewPasswordController,
                        err: 'passwords do not match!',
                        isValidationError:
                            changePassword.confirmNewPasswordError,
                        hint: 'Enter new password',
                        togglePassword: changePassword.isNewPasswordIconVisible,
                        togglePasswordCallback: () =>
                            changePassword.toggleNewPassword(),
                        isPassword: true,
                        obsecure: changePassword.isNewPasswordVisible,
                        iconSize: 20,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: textColor6,
                          fontWeight: FontWeight.normal,
                        ),
                        textInputType: TextInputType.text,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 8.75,
                  ),
                  Container(
                    height: 30,
                    child: BidCustomButtonWidget(
                        color: black,
                        text: 'Update',
                        textSize: 14,
                        textColor: white,
                        onPressed: () => _validate(changePassword),
                        splashColor: black),
                  )
                ],
              ),
            ));
  }

  void _validate(ChangePasswordProviders changePassword) {
    if (changePassword.verifyPassword(_newPasswordController.text,
        _confirmNewPasswordController.text,)) {
      changePassword.changePassword(
          map: ChangePasswordModel.toJson(
              currentPassword: 'NewPassword1',
              newPassword: _newPasswordController.text,
              confirmNewPassword: _confirmNewPasswordController.text));
    }else{
      print('not validated');
    }
  }
}
