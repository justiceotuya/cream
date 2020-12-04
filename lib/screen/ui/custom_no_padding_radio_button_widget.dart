import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';

import 'text_view_widget.dart';

class NoPaddingRadioButton extends StatelessWidget {
  final bool isMarked;
  final Function(bool newValue) onChange;
  final double size;
  final String title;

  NoPaddingRadioButton({
    @required this.isMarked,
    @required this.onChange,
    @required this.title,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size, maxWidth: size),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Icon(_getIconData(), color: yellow, size: size),
            SizedBox(
              width: 5,
            ),
            TextViewWidget(
              text: title,
              textSize: 14,
              color: textColor5,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
        onPressed: () => onChange(!isMarked),
      ),
    );
  }

  IconData _getIconData() {
    if (isMarked) {
      return Icons.radio_button_checked;
    }

    return Icons.radio_button_off_outlined;
  }
}
