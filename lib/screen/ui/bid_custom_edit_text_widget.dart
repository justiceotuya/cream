import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class BidCustomEditTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obsecure;
  final bool isPassword;
  final TextInputType textInputType;
  final String hint;
  final String err;
  final Function(String text) textCallBack;
  final Function(String text) submitted;
  final Function(String text) validator;
  final int maxLength;
  final TextStyle style;
  final TextAlign textAlign;
  final bool isValidationError;
  bool isEnabled;
  final bool showFlag;
  final FocusNode focusNode;
  final List<TextInputFormatter> inputFormatters;
  final double fontSize;
  final bool togglePassword;
  final VoidCallback togglePasswordCallback;
  final double borderRadius;

  BidCustomEditTextWidget(
      {@required this.controller,
      this.label,
      this.obsecure = false,
      this.isPassword = false,
      @required this.textInputType,
      @required this.hint,
      @required this.err,
      this.textCallBack,
      this.submitted,
      this.style,
      this.borderRadius = 10,
      this.textAlign = TextAlign.left,
      this.validator,
      this.maxLength,
      this.focusNode,
      this.showFlag = false,
      this.isValidationError = false,
      this.isEnabled = true,
      this.fontSize = 14,
      this.inputFormatters,
      this.togglePassword = false,
      this.togglePasswordCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
          border: Border.all(
            color: borderColor,
          )),
      child: TextFormField(
        onChanged: textCallBack,
        maxLength: maxLength,
        controller: controller,
        focusNode: focusNode,
        cursorColor: black,
        // ignore: missing_return
        validator: validator,
        textAlign: textAlign,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal),
        obscureText: obsecure,
        enabled: isEnabled,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: textHint1, fontSize: fontSize),
            border: InputBorder.none,
            counterText: ''),
      ),
    );
  }
}
