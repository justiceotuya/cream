import 'package:flutter/material.dart';

class FloatingDropdownWidget extends StatelessWidget {
  final String label;
  final List<dynamic> mapList;
  final String hint;
  final String err;
  final Function(dynamic text) textCallBack;
  final TextStyle style;
  final TextStyle labelStyle;
  final TextAlign textAlign;
  final TextAlign hintAlign;
  bool isEnabled;
  bool isDense;
  final double fontSize;
  final FloatingLabelBehavior floatingLabelBehavior;
  dynamic value;

  FloatingDropdownWidget(
      {this.label,
      this.hint,
      this.err,
      @required this.textCallBack,
      this.style,
      this.labelStyle,
      this.textAlign = TextAlign.left,
      this.hintAlign = TextAlign.left,
      this.isEnabled = true,
      this.isDense = true,
      this.fontSize = 14,
      @required this.mapList,
      @required this.value,
      this.floatingLabelBehavior = FloatingLabelBehavior.always});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: FormField<dynamic>(
        builder: (FormFieldState<dynamic> state) {
          return InputDecorator(
            decoration: InputDecoration(
                labelStyle: labelStyle,
                labelText: label,
                isDense: true,
                floatingLabelBehavior: floatingLabelBehavior,
                errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: fontSize),
                hintText: hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                value: value,
                onChanged: textCallBack,
                items: mapList.map((dynamic value) {
                  return DropdownMenuItem<dynamic>(
                    value: value,
                    child: Text(
                      value.toString().toUpperCase(),
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
