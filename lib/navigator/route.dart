import 'package:cream_platform_app/screen/authentication/forgot_password/forgot_password_verify_code_screen.dart';
import 'package:cream_platform_app/screen/authentication/forgot_password/set_new_password_screen.dart';
import 'package:cream_platform_app/screen/authentication/login/login_page.dart';
import 'package:cream_platform_app/screen/authentication/signup/signup.dart';
import 'package:cream_platform_app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

BuildContext globalContext;
bool hasOpenedLogOutDialog = false;

class Routes {
  static const String SPLASH = '/splash';
  static const String FORGOT_PASSWORD = '/forgotPassword';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String SET_NEW_PASSWORD = '/setNewPassword';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        SPLASH: (BuildContext context) {
          globalContext = context;
          return SplashScreen();
        },
        FORGOT_PASSWORD: (BuildContext context) {
          globalContext = context;
          return ForgotPasswordVerifyCodePage();
        },
        LOGIN: (BuildContext context) {
          globalContext = context;
          return LoginPage();
        },
        REGISTER: (BuildContext context) {
          globalContext = context;
          return SignupPage();
        },
        SET_NEW_PASSWORD: (BuildContext context) {
          globalContext = context;
          return SetNewPasswordPage();
        },
      };
}
