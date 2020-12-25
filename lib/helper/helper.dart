import 'dart:io';
import 'dart:math';

import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:cream_platform_app/screen/ui/custom_alert_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

///@ launch urls//
void launchURLs({@required String link}) async {
  if (await canLaunch(link)) launch(link);
}

///@ gets screen height//
double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///@ gets screen width//
double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///@ show short screen notifications inform of a toast
void showToast(BuildContext context,
    {@required String message, int position = 1}) {
  Toast.show(message, context,
      duration: 5,
      backgroundColor: yellow,
      backgroundRadius: 8,
      textColor: black,
      gravity: position);
}

/// @ show short screen notifications inform of a snackbar
void showSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String msg,
    {double height = 30, Color color = black}) {
  if (_scaffoldKey == null || _scaffoldKey.currentState == null) {
    return;
  }
  _scaffoldKey.currentState.hideCurrentSnackBar();
  final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(
        msg,
        style: TextStyle(
          color: Colors.white,
        ),
      ));
  _scaffoldKey.currentState.showSnackBar(snackBar);
}

/// prints excessively long statements
void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) {
    print(match.group(0));
  });
}

/// @ get naira sign
String getNairaSign(BuildContext context, dynamic amount) {
  return '${NumberFormat.simpleCurrency(name: "NGN").format(int.parse(amount.toString()))}';
}

/// @ validate email
bool validateEmail(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  var status = regExp.hasMatch(email);
  return status;
}

/// @ verifies users password
bool isPasswordCompliant(String password, [int minLength = 8]) {
  if (password == null || password.isEmpty) {
    return false;
  }

  bool _hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool _hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool _hasLowercase = password.contains(new RegExp(r'[a-z]'));
  // bool _hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool _hasMinLength = password.length >= minLength;
  return _hasDigits & _hasUppercase & _hasLowercase & _hasMinLength;
}

/// @ shuffle a list
List shuffle(List items) {
  Random random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

/// @open drawer
void openEndDrawer(GlobalKey<ScaffoldState> _scaffoldKey) {
  _scaffoldKey.currentState.openEndDrawer();
}

/// @close drawer
void closeEndDrawer(BuildContext context) {
  PageRouter.goBack(context);
}

/// @ show dialog
void showFundDialogBox({@required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) => CustomFundAlertDialog(
            yesOnPressed: () {
              Navigator.of(context).pop();
              PageRouter.gotoWidget(MyHomePage(bottomNavIndex: 5), context);
            },
            noOnPressed: () => Navigator.of(context).pop(),
          ));
}

void showBidAlertDialogBox({@required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) => CustomBidAlertDialog(
            yesOnPressed: () {
              Navigator.of(context).pop();
            },
            noOnPressed: () => Navigator.of(context).pop(),
          ));
}

void showCircleDialogBox(
    {@required BuildContext context, @required String content}) {
  showDialog(
      context: context,
      builder: (BuildContext context) => CustomCircleAlertDialog(
            content: content,
            yesOnPressed: () {
              Navigator.of(context).pop();
            },
            noOnPressed: () => Navigator.of(context).pop(),
          ));
}

/// @ get headers
Future<Options> getDioHeader({String token}) async {
  return Options(headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
}

List<String> _initials = ["070", "080", "081", '090', "091", "071"];

/// Validate phone numbers
bool isPhoneNumberValid(String phoneNumber) {
  try {
    bool _isEmpty =
        phoneNumber.isNotEmpty; // first test: check if phone number is empty
    bool _isStartInitialsCorrect = _initials.contains(phoneNumber.substring(0,
        3)); // second test: check if the first 3 characters are found in the initials list
    bool _isNumberLength = phoneNumber.length ==
        11; // third test: check if the length of the number is equal to 11 digits
    bool _allNumberTheSame = _allCharactersSame(phoneNumber.substring(
            3, 11)) // fourth test: check if all other characters are the same
        ? false
        : true;
    return _isEmpty &&
        _isStartInitialsCorrect &&
        _isNumberLength &&
        _allNumberTheSame;
  } catch (e) {
    return false;
  }
}

// checks if all characters are the same
bool _allCharactersSame(String s) {
  int n = s.length;
  for (int i = 1; i < n; i++) if (s[i] != s[0]) return false;

  return true;
}
