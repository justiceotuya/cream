import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_dropdown_widget.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_edit_text_widget.dart';
import 'package:flutter/material.dart';

class Loan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 35,
                child: FloatingBorderEditTextWidget(
                  controller: null,
                  err: 'required parameter',
                  hint: 'Enter amount',
                  labelStyle: TextStyle(color: textColor8, fontSize: 16),
                  textInputType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(
              width: 29,
            ),
            BidCustomButtonWidget(
              onPressed: () {},
              color: yellow,
              textColor: white,
              text: 'Make Request',
              textSize: 13,
              splashColor: yellowSplash,
            ),
          ],
        ),
      ],
    );
  }
}
