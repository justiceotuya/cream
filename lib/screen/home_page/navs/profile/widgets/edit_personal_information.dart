import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/floating_without_border_edit_text_widget.dart';
import 'package:flutter/material.dart';

class EditPersonInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: FloatingNoBorderEditTextWidget(
                controller: null,
                err: '',
                hint: 'Username',
                labelStyle: TextStyle(
                  fontSize: 12,
                  color: textColor6,
                  fontWeight: FontWeight.normal,
                ),
                textInputType: TextInputType.text,
              )),
              SizedBox(
                width: 31,
              ),
              Expanded(
                  child: FloatingNoBorderEditTextWidget(
                controller: null,
                err: '',
                hint: 'Phone number',
                labelStyle: TextStyle(
                  fontSize: 12,
                  color: textColor6,
                  fontWeight: FontWeight.normal,
                ),
                textInputType: TextInputType.number,
              )),
            ],
          ),
          SizedBox(
            height: 8.75,
          ),
          Container(
            height: 30,
            child: BidCustomButtonWidget(
                color: black,
                text: 'Update',
                textSize: 14,
                textColor: white,
                onPressed: () => showCircleDialogBox(
                    context: context,
                    content: 'Personal\nInformation\nUpdated'),
                splashColor: black),
          )
        ],
      ),
    );
  }
}
