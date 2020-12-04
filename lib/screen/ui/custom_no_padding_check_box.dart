import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';

class NoPaddingCheckbox extends StatelessWidget {
  final bool isMarked;
  final Function(bool newValue) onChange;
  final double size;

  NoPaddingCheckbox({
    @required this.isMarked,
    @required this.onChange,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size, maxWidth: size),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Icon(_getIconData(), color: yellow, size: size),
        onPressed: () => onChange(!isMarked),
      ),
    );
  }

  IconData _getIconData() {
    if (isMarked) {
      return Icons.check_box;
    }

    return Icons.check_box_outline_blank;
  }
}
