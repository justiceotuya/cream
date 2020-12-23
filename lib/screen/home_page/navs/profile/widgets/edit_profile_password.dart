import 'package:cream_platform_app/apis/user/password/model/password_model.dart';
import 'package:cream_platform_app/apis/user/password/provider/change_password_provider.dart';
import 'package:cream_platform_app/helper/validators.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/custom_edit_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPassword extends StatelessWidget {
  TextEditingController oldPasswordController;

  TextEditingController newPasswordController;

  TextEditingController confirmNewPasswordController;

  EditPassword({
    @required this.oldPasswordController,
    @required this.newPasswordController,
    @required this.confirmNewPasswordController,
  });

  ChangePasswordProvider _changePasswordProviders;
  var _globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _changePasswordProviders =
        Provider.of<ChangePasswordProvider>(context, listen: false);
    _changePasswordProviders.initialize(context);
    return Form(
      key: _globalFormKey,
      child: Consumer<ChangePasswordProvider>(
          builder: (_, provider, __) => Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditFormField(
                      controller: oldPasswordController,
                      label: 'Old password',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      focusedColorBorder: yellow,
                      obSecureText: provider.hideOldPassword,
                      suffixIcon: provider.hideOldPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      visibleIconTapped: () =>
                          provider.toggleOldPasswordVisibility(),
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.text,
                      validator: Validators.validateString(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EditFormField(
                            controller: newPasswordController,
                            label: 'New password',
                            labelStyle: TextStyle(color: textColor6),
                            onSaved: (value) {},
                            focusedColorBorder: yellow,
                            obSecureText: provider.newOldPassword,
                            suffixIcon: provider.newOldPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            visibleIconTapped: () =>
                                provider.toggleNewPasswordVisibility(),
                            autoValidate: provider.autoValidate,
                            keyboardType: TextInputType.text,
                            validator: Validators.validateString(),
                          ),
                        ),
                        SizedBox(
                          width: 31,
                        ),
                        Expanded(
                          child: EditFormField(
                            controller: confirmNewPasswordController,
                            label: 'Confirm',
                            labelStyle: TextStyle(color: textColor6),
                            onSaved: (value) {},
                            focusedColorBorder: yellow,
                            obSecureText: provider.confirmNewPassword,
                            suffixIcon: provider.confirmNewPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            visibleIconTapped: () =>
                                provider.toggleConfirmPasswordVisibility(),
                            autoValidate: provider.autoValidate,
                            keyboardType: TextInputType.text,
                            validator: Validators.validateString(),
                          ),
                        ),
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
                          onPressed: () => _validate(context),
                          splashColor: black),
                    )
                  ],
                ),
              )),
    );
  }

  void _validate(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState.validate())
      _changePasswordProviders.changePassword(
          map: ChangePasswordModel.toJson(
        currentPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        confirmPassword: confirmNewPasswordController.text,
      ));
    else
      _changePasswordProviders.toggleAutoValidate(true);
  }
}
