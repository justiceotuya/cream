import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_edit_text_widget.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/forgot_password_providers.dart';

class ForgotPasswordVerifyCodePage extends StatefulWidget {
  @override
  _ForgotPasswordVerifyCodePageState createState() =>
      _ForgotPasswordVerifyCodePageState();
}

class _ForgotPasswordVerifyCodePageState
    extends State<ForgotPasswordVerifyCodePage> {
  bool _codeError = false;

  ForgotPasswordProviders _forgotPasswordProviders;

  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    _forgotPasswordProviders =
        Provider.of<ForgotPasswordProviders>(context, listen: false);
    _forgotPasswordProviders.initialize(context);
    super.initState();
  }

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
                  'Code sent. Check your mail for code, enter it to reset your code.',
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
              controller: _codeController,
              err: 'valid code is required',
              hint: 'Enter Code',
              isValidationError: _codeError,
              labelStyle: TextStyle(color: textColor8, fontSize: 16),
              textInputType: TextInputType.number,
              textCallBack: (v) => setState(() => _codeError = false),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 48,
              child: BidCustomButtonWidget(
                onPressed: () => PageRouter.gotoNamed(
                    Routes.SET_NEW_PASSWORD, context,
                    clearStack: true),
                color: black,
                splashColor: black3,
                textColor: white,
                text: 'Submit',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Didn\'t get code?  ',
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor8,
                      fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => null,
                      text: 'Resend',
                      style: TextStyle(
                          fontSize: 16,
                          color: blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 49,
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
}
