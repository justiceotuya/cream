import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/helper/route.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/authentication/login/provider/login_providers.dart';
import 'package:cream_platform_app/screen/authentication/signup/signup.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/custom_no_padding_check_box.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_edit_text_widget.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/get_token_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  bool _togglePassword = true;
  bool _isUserNameError = false;
  bool _isPasswordError = false;

  LoginProviders _loginProviders;

  final TextEditingController _userNameOrPhoneNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _loginProviders = Provider.of<LoginProviders>(context, listen: false);
    _loginProviders.initialize(context);
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
              text: 'Login',
              textSize: 22,
              textAlign: TextAlign.left,
              maxLines: 1,
              color: textColor7,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(
              height: 39,
            ),
            FloatingBorderEditTextWidget(
              controller: _userNameOrPhoneNumberController,
              err: 'valid phone number is required',
              hint: 'Mobile Number',
              maxLength: 11,
              isValidationError: _isUserNameError,
              labelStyle: TextStyle(color: textColor8, fontSize: 16),
              textInputType: TextInputType.text,
              textCallBack: (v) => setState(() => _isUserNameError = false),
            ),
            SizedBox(
              height: 40,
            ),
            FloatingBorderEditTextWidget(
              controller: _passwordController,
              isPassword: true,
              isValidationError: _isPasswordError,
              obsecure: _togglePassword,
              togglePassword: _togglePassword,
              togglePasswordCallback: () =>
                  setState(() => _togglePassword = !_togglePassword),
              err: 'password is required',
              hint: 'Password',
              labelStyle: TextStyle(color: textColor8, fontSize: 16),
              textInputType: TextInputType.text,
              textCallBack: (v) => setState(() => _isPasswordError = false),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NoPaddingCheckbox(
                      isMarked: _isChecked,
                      onChange: (val) => setState(() => _isChecked = val),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextViewWidget(
                      text: 'Remember me',
                      textSize: 14,
                      color: black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                TextViewWidget(
                  text: 'Forgot password?',
                  textSize: 14,
                  color: blue,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 48,
              child: BidCustomButtonWidget(
                onPressed: () => _loginUser(),
                color: black,
                splashColor: black3,
                textColor: white,
                text: 'Login',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Don\'t have an account?  ',
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor8,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            pushReplace(context: context, child: SignupPage()),
                      text: 'Register',
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

  void _loginUser() {
    if (!isPhoneNumberValid(_userNameOrPhoneNumberController.text)) {
      setState(() => _isUserNameError = true);
      return;
    }
    if (_passwordController.text.isEmpty) {
      setState(() => _isPasswordError = true);
      return;
    }
    _loginProviders.loginUser(
        map: GetTokenModel.toJson(
          phoneNumber: _userNameOrPhoneNumberController.text,
          password: _passwordController.text,
        ),
        keepMeSignedIn: _isChecked);
  }
}
