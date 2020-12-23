import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditFormField extends StatelessWidget {
  EditFormField({
    this.label = '',
    this.hint = '',
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.controller,
    this.initialValue,
    this.autoValidate = false,
    this.autocorrect = true,
    this.enabled = true,
    this.onTapped,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.focusedColorBorder,
    this.labelStyle,
  });
  String label;
  String hint;
  IconData prefixIcon;
  IconData suffixIcon;

  Function(String) onSaved;
  Function(String) validator;

  String initialValue;
  TextEditingController controller;

  bool autocorrect;
  bool autoValidate;
  bool enabled;

  bool clickable;
  Function() onTapped;

  TextInputType keyboardType;
  int maxLines;
  int minLines;
  int maxLength;
  var inputFormatters;

  final Color focusedColorBorder;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return onTapped != null
        ? InkWell(
      onTap: onTapped,
      child: IgnorePointer(
        ignoring: true,
        child: TextFormField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          enabled: enabled,
          autovalidate: autoValidate ?? false,
          onSaved: onSaved,
          validator: validator,
          autocorrect: autocorrect,
          initialValue: initialValue,
          controller: controller,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: grey1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: focusedColorBorder),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: grey1),
              ),
              hintText: hint,
              labelText: label,
              labelStyle: labelStyle,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null),
        ),
      ),
    )
        : TextFormField(
      keyboardType: keyboardType,
      enabled: enabled,
      autovalidate: autoValidate ?? false,
      onSaved: onSaved,
      maxLines: maxLines,
      autocorrect: autocorrect,
      minLines: minLines,
      maxLength: maxLength,
      validator: validator,
      initialValue: initialValue,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: grey1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: focusedColorBorder),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: grey1),
          ),
          hintText: hint,
          labelText: label,
          labelStyle: labelStyle,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null),
    );
  }
}
