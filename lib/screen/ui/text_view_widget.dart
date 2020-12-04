import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';

class TextViewWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String fontFamily;
  final int maxLines;
  final TextAlign textAlign;
  final Color color;
  final VoidCallback onTap;

  TextViewWidget({
    @required this.text,
    this.textSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.color = textColor1,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            fontSize: textSize),
      ),
    );
  }
}
