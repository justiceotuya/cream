import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text_view_widget.dart';

// ignore: must_be_immutable
class EditTextWidget extends StatelessWidget {
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
  final double fieldHeight;
  final FontWeight fontWeight;

  EditTextWidget({
    @required this.controller,
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
    this.textAlign = TextAlign.left,
    this.hintAlign = TextAlign.left,
    this.validator,
    this.maxLength,
    this.focusNode,
    this.fieldHeight = 38,
    this.showFlag = false,
    this.isValidationError = false,
    this.isEnabled = true,
    this.fontSize = 14,
    this.inputFormatters,
    this.togglePassword = false,
    this.showChoosButton = false,
    this.togglePasswordCallback,
    this.onTap,
    this.fontWeight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: hint != null ? true : false,
              child: TextViewWidget(
                text: hint,
                textSize: 12,
                textAlign: hintAlign,
                fontWeight: fontWeight,
              ),
            ),
            Visibility(
              visible: chooseButtonHint != null ? true : false,
              child: TextViewWidget(
                text: chooseButtonHint,
                textSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          height: fieldHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: grey1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    onChanged: textCallBack,
                    maxLength: maxLength,
                    controller: controller,
                    focusNode: focusNode,
                    cursorColor: black,
                    // ignore: missing_return
                    validator: validator,
                    textAlign: textAlign,
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.normal),
                    obscureText: obsecure,
                    enabled: isEnabled,
                    keyboardType: textInputType,
                    inputFormatters: inputFormatters,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: red,
                        ),
                        hintText: '',
                        hintStyle: TextStyle(fontSize: fontSize),
                        border: InputBorder.none,
                        counterText: ''),
                  ),
                ),
              ),
              Visibility(
                visible: showChoosButton,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), color: yellow),
                    child: Center(
                      child: TextViewWidget(
                        text: 'Choose',
                        textSize: 14,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isPassword,
                child: IconButton(
                    icon: !togglePassword
                        ? Icon(
                      Icons.visibility_off,
                      color: yellow,
                    )
                        : Icon(
                      Icons.visibility,
                      color: yellow,
                    ),
                    onPressed: togglePasswordCallback),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Visibility(
            visible: isValidationError,
            child: Text(
              err,
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}
