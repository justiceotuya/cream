import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:flutter/material.dart';

import 'bubble_selection_painter.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isActive;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color bubbleColor;
  final Color activeColor;
  final Color inactiveColor;
  final String iconData;
  final double iconScale;
  final double iconSize;
  final VoidCallback onTap;

  NavigationBarItem({
    this.isActive,
    this.bubbleRadius,
    this.maxBubbleRadius,
    this.bubbleColor,
    this.activeColor,
    this.inactiveColor,
    this.iconData,
    this.iconScale,
    this.iconSize,
    this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: BubblePainter(
            bubbleRadius: isActive ? bubbleRadius : 0,
            bubbleColor: bubbleColor,
            maxBubbleRadius: maxBubbleRadius,
          ),
          child: InkWell(
            child: Transform.scale(
              scale: isActive ? iconScale : 1,
              child: ImageLoader(
                path: iconData,
                dColor: isActive ? activeColor : inactiveColor,
                width: iconSize,
                height: iconSize,
              ),
            ),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class GapItem extends StatelessWidget {
  final double width;

  GapItem({this.width});

  @override
  Widget build(BuildContext context) => Container(width: width);
}
