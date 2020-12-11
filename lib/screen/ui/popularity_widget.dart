import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Popularity extends StatelessWidget {
  String icon;
  int number;
  String text;

  Popularity({@required this.icon, @required this.number, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextViewWidget(
          text: '$number',
          textSize: 24,
          textAlign: TextAlign.center,
          color: black,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageLoader(
              path: icon,
              width: 20,
              height: 20,
              dColor: black,
            ),
            SizedBox(
              width: 5,
            ),
            TextViewWidget(
              text: text,
              textSize: 14,
              textAlign: TextAlign.center,
              color: yellow1,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
          ],
        )
      ],
    );
  }
}
