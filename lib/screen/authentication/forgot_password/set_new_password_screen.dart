import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_edit_text_widget.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SetNewPasswordPage extends StatefulWidget {
  @override
  _SetNewPasswordPageState createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  bool _newPasswordError = false;
  bool _confirmNewPasswordError = false;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 70,
            ),
            ImageLoader(
              path: appIcon,
              width: 84,
              height: 84,
            ),
            SizedBox(
              height: 46,
            ),
            TextViewWidget(
              text: 'Recover Password',
              textSize: 22,
              textAlign: TextAlign.left,
              maxLines: 1,
              color: textColor7,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(
              height: 10,
            ),
            TextViewWidget(
              text:
                  'Enter new password.',
              textSize: 14,
              textAlign: TextAlign.left,
              color: textColor6,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(
              height: 39,
            ),
            FloatingBorderEditTextWidget(
              controller: _newPasswordController,
              err: 'valid password format is required',
              hint: 'Enter New Password',
              isValidationError: _newPasswordError,
              labelStyle: TextStyle(color: textColor8, fontSize: 16),
              textInputType: TextInputType.text,
              textCallBack: (v) => setState(() => _newPasswordError = false),
            ),
            SizedBox(
              height: 39,
            ),
            FloatingBorderEditTextWidget(
              controller: _confirmNewPasswordController,
              err: 'Passwords do not match!',
              hint: 'Confirm New Password',
              isValidationError: _confirmNewPasswordError,
              labelStyle: TextStyle(color: textColor8, fontSize: 16),
              textInputType: TextInputType.text,
              textCallBack: (v) =>
                  setState(() => _confirmNewPasswordError = false),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 48,
              child: BidCustomButtonWidget(
                onPressed: () => _forgottenPassword(),
                color: black,
                splashColor: black3,
                textColor: white,
                text: 'Submit',
              ),
            ),
            SizedBox(
              height: 69,
            ),
            Text.rich(
              TextSpan(
                text: 'By continue, you are agree to our ',
                style: TextStyle(
                    fontSize: 14,
                    color: textColor8,
                    fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => null,
                    text: 'Terms of Service',
                    style: TextStyle(
                        fontSize: 14,
                        color: blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => null,
                    text: ' and ',
                    style: TextStyle(
                        fontSize: 14,
                        color: textColor8,
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => null,
                    text: 'Privacy Policy.',
                    style: TextStyle(
                        fontSize: 14,
                        color: blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _forgottenPassword() {
    // _forgotPasswordProviders.forgotPassword(emailAddress: _emailAddressController.text);
  }
}
