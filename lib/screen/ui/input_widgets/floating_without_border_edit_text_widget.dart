import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class FloatingNoBorderEditTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obsecure;
  final bool isPassword;
  final TextInputType textInputType;
  final String hint;
  final String chooseButtonHint;
  final String err;
  final Function(String text) textCallBack;
  final Function(String text) submitted;
  final Function(String text) validator;
  final int maxLength;
  final TextStyle style;
  final TextStyle labelStyle;
  final TextAlign textAlign;
  final TextAlign hintAlign;
  final bool isValidationError;
  bool isEnabled;
  final bool showFlag;
  final FocusNode focusNode;
  final List<TextInputFormatter> inputFormatters;
  final double fontSize;
  final bool togglePassword;
  final VoidCallback togglePasswordCallback;
  final VoidCallback onTap;
  bool showChoosButton;
  final FloatingLabelBehavior floatingLabelBehavior;
  final double iconSize;

  FloatingNoBorderEditTextWidget(
      {@required this.controller,
      this.label,
      this.obsecure = false,
      this.isPassword = false,
      @required this.textInputType,
      @required this.hint,
      this.chooseButtonHint,
      @required this.err,
      this.textCallBack,
      this.submitted,
      this.style,
      this.labelStyle,
      this.textAlign = TextAlign.left,
      this.hintAlign = TextAlign.left,
      this.validator,
      this.maxLength,
      this.focusNode,
      this.showFlag = false,
      this.isValidationError = false,
      this.isEnabled = true,
      this.fontSize = 14,
      this.iconSize = 24,
      this.inputFormatters,
      this.togglePassword = false,
      this.showChoosButton = false,
      this.togglePasswordCallback,
      this.onTap,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextFormField(
        onChanged: textCallBack,
        maxLength: maxLength,
        controller: controller,
        focusNode: focusNode,
        cursorColor: black,
        // ignore: missing_return
        validator: validator,
        textAlign: textAlign,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
        obscureText: obsecure,
        enabled: isEnabled,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: isPassword,
            child: IconButton(
                iconSize: iconSize,
                icon: !togglePassword
                    ? Icon(
                        Icons.visibility_off,
                        color: textColor8,
                      )
                    : Icon(
                        Icons.visibility,
                        color: textColor8,
                      ),
                onPressed: togglePasswordCallback),
          ),
          labelText: hint,
          labelStyle: labelStyle,
          floatingLabelBehavior: floatingLabelBehavior,
        ),
      ),
    );
  }
}
