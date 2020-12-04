import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';

import 'text_view_widget.dart';

class CustomExpansionTile extends StatelessWidget {
  String leading;
  String title;
  final VoidCallback onTap;
  bool isOpened;
  dynamic t;

  CustomExpansionTile(
      {this.leading,
      @required this.title,
      @required this.onTap,
      this.isOpened = false,
      this.t
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Visibility(
            visible: leading != null ? true : false,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageLoader(
                  path: leading,
                  dColor: textColor6,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          TextViewWidget(
            text: title,
            textSize: 16,
            textAlign: TextAlign.left,
            color: textColor6,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
          Spacer(),
          Icon(
            isOpened ? Icons.clear : Icons.add,
            color: borderColor,
          ),
        ],
      ),
    );
  }
}
