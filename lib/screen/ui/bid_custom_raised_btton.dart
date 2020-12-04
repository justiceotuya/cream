import 'package:flutter/material.dart';

import 'text_view_widget.dart';

class BidCustomButtonWidget extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color splashColor;
  final String text;
  final double textSize;
  final VoidCallback onPressed;

  BidCustomButtonWidget(
      {@required this.color,
      @required this.text,
      @required this.textColor,
      @required this.onPressed,
        this.textSize = 16,
      @required this.splashColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      splashColor: splashColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: color)),
      child: TextViewWidget(
        text: text,
        color: textColor,
        textSize: textSize,
      ),
    );
  }
}
