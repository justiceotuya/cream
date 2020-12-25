import 'package:cream_platform_app/helper/constants.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/navigator/route.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/authentication/signup/model/register_model.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_dropdown_widget.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_edit_text_widget.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/signup_providers.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _togglePassword = true;
  SignUpProviders _signUpProvider;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String _gender;
  String _state;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _firstNameError = false;
  bool _lastNameError = false;
  bool _phoneNumberError = false;
  bool _addressError = false;
  bool _passwordError = false;
  bool _emailError = false;

  @override
  void initState() {
    _signUpProvider = Provider.of<SignUpProviders>(context, listen: false);
    _signUpProvider.initialize(context);
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
              text: 'Register',
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
            Row(
              children: [
                Expanded(
                  child: FloatingBorderEditTextWidget(
                    controller: _firstNameController,
                    err: 'first name is required',
                    hint: 'First name',
                    labelStyle: TextStyle(color: textColor8, fontSize: 16),
                    textInputType: TextInputType.text,
                    isValidationError: _firstNameError,
                    textCallBack: (_) =>
                        setState(() => _firstNameError = false),
                  ),
                ),
                SizedBox(
                  width: 29,
                ),
                Expanded(
                  child: FloatingBorderEditTextWidget(
                    controller: _lastNameController,
                    err: 'last name is required',
                    hint: 'Last name',
                    labelStyle: TextStyle(color: textColor8, fontSize: 16),
                    textInputType: TextInputType.text,
                    isValidationError: _lastNameError,
                    textCallBack: (_) => setState(() => _lastNameError = false),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: FloatingBorderEditTextWidget(
                    controller: _phoneNumberController,
                    err: 'valid phone number is required',
                    hint: 'Phone number',
                    labelStyle: TextStyle(color: textColor8, fontSize: 16),
                    textInputType: TextInputType.text,
                    maxLength: 11,
                    isValidationError: _phoneNumberError,
                    textCallBack: (_) =>
                        setState(() => _phoneNumberError = false),
                  ),
                ),
                SizedBox(
                  width: 29,
                ),
                Expanded(
                  child: FloatingDropdownWidget(
                      label: 'Sex',
                      labelStyle: TextStyle(color: textColor8, fontSize: 16),
                      textCallBack: (val) => setState(() => _gender = val),
                      mapList: gender,
                      value: _gender != null ? _gender : gender.first),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: FloatingBorderEditTextWidget(
                    controller: _emailController,
                    err: 'valid email address is required',
                    hint: 'Email',
                    labelStyle: TextStyle(color: textColor8, fontSize: 16),
                    textInputType: TextInputType.emailAddress,
                    isValidationError: _emailError,
                    textCallBack: (_) =>
                        setState(() => _phoneNumberError = false),
                  ),
                ),
                SizedBox(
                  width: 29,
                ),
                Expanded(
                  child: FloatingDropdownWidget(
                      label: 'State',
                      labelStyle: TextStyle(color: textColor8, fontSize: 16),
                      textCallBack: (val) => setState(() => _state = val),
                      mapList: state,
                      value: _state != null ? _state : state.first),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            FloatingBorderEditTextWidget(
              controller: _addressController,
              err: 'address is required',
              hint: 'Address',
              labelStyle: TextStyle(color: textColor8, fontSize: 16),
              textInputType: TextInputType.text,
              isValidationError: _addressError,
              textCallBack: (_) => setState(() => _addressError = false),
            ),
            SizedBox(
              height: 30,
            ),
            FloatingBorderEditTextWidget(
              controller: _passwordController,
              isPassword: true,
              obsecure: _togglePassword,
              togglePassword: _togglePassword,
              togglePasswordCallback: () =>
                  setState(() => _togglePassword = !_togglePassword),
              err: 'required parameter',
              hint: 'Password',
              labelStyle: TextStyle(color: textColor8, fontSize: 16),
              textInputType: TextInputType.text,
              isValidationError: _passwordError,
              textCallBack: (_) => setState(() => _passwordError = false),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 48,
              child: BidCustomButtonWidget(
                onPressed: () => _registerUser(),
                color: black,
                splashColor: black3,
                textColor: white,
                text: 'Register',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Have an account?  ',
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor8,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => PageRouter.gotoNamed(
                            Routes.REGISTER, context,
                            clearStack: true),
                      text: 'Login',
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
              height: 23,
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

  void _registerUser() {
    if (!_validateInput()) return;
    _signUpProvider.signUpUser(
        map: RegisterModel.toJson(
            address: _addressController.text,
            email: _emailController.text,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            password: _passwordController.text,
            phone: _phoneNumberController.text,
            sex: _gender ?? gender.first,
            state: _state ?? state.first));
  }

  bool _validateInput() {
    if (_firstNameController.text.isEmpty) {
      setState(() => _firstNameError = true);
      return false;
    }

    if (_lastNameController.text.isEmpty) {
      setState(() => _lastNameError = true);
      return false;
    }

    if (!isPhoneNumberValid(_phoneNumberController.text)) {
      setState(() => _phoneNumberError = true);
      return false;
    }

    if (!validateEmail(_emailController.text)) {
      setState(() => _emailError = true);
      return false;
    }

    if (_addressController.text.isEmpty) {
      setState(() => _addressError = true);
      return false;
    }

    if (_passwordController.text.isEmpty) {
      setState(() => _passwordError = true);
      return false;
    }

    return true;
  }
}
