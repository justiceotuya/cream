import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/custom_switch.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class Suscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextViewWidget(
                    text: 'Turn on Autorenewal',
                    textSize: 14,
                    textAlign: TextAlign.left,
                    color: textColor6,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: CustomSwitch(
                      onChanged: (val) {},
                      value: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 48,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextViewWidget(
                  text: 'Subscription : Active',
                  textSize: 14,
                  textAlign: TextAlign.left,
                  color: textColor6,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: green),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextViewWidget(
              text: 'Change Plan',
              textSize: 14,
              textAlign: TextAlign.left,
              color: textColor6,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: white,
                  border: Border.all(color: borderColor)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: null,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 12,
                    ),
                    items: [],
                    onChanged: (value) {}),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextViewWidget(
              text: 'Change Category',
              textSize: 14,
              textAlign: TextAlign.left,
              color: textColor6,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: white,
                  border: Border.all(color: borderColor)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: null,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 12,
                    ),
                    items: [],
                    onChanged: (value) {}),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BidCustomButtonWidget(
            onPressed: () {},
            color: yellow,
            textColor: white,
            text: 'Save Change',
            textSize: 13,
            splashColor: yellowSplash,
          ),
        ),
      ],
    );
  }
}
