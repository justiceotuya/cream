import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:flutter/material.dart';

import 'bid_custom_raised_btton.dart';
import 'text_view_widget.dart';

// ignore: must_be_immutable
class CustomFundAlertDialog extends StatelessWidget {
  Function _yesOnPressed;
  Function _noOnPressed;

  CustomFundAlertDialog(
      {String title,
      String content,
      Function yesOnPressed,
      Color color,
      Function noOnPressed,
      bool showNoButton = true,
      bool showYesButton = true,
      String yes = "Yes",
      String no = "No"}) {
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25,
          ),
          Icon(
            Icons.info_outline,
            color: red,
            size: 60,
          ),
          SizedBox(
            height: 38,
          ),
          TextViewWidget(
            text: 'Insufficient Funds',
            textSize: 20,
            textAlign: TextAlign.left,
            maxLines: 1,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
          SizedBox(
            height: 12,
          ),
          TextViewWidget(
            text: 'Please fund your wallet to bid',
            textSize: 16,
            textAlign: TextAlign.center,
            maxLines: 1,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          SizedBox(
            height: 23,
          ),
          Container(
            width: getWidth(context) / 2,
            child: BidCustomButtonWidget(
              onPressed: _yesOnPressed,
              color: yellow,
              textColor: white,
              text: 'Fund Wallet',
              splashColor: yellowSplash,
            ),
          ),
          Container(
            width: getWidth(context) / 2,
            child: BidCustomButtonWidget(
              onPressed: _noOnPressed,
              color: black,
              textColor: white,
              text: 'Cancel',
              splashColor: black1,
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomBidAlertDialog extends StatelessWidget {
  Function _yesOnPressed;
  Function _noOnPressed;

  CustomBidAlertDialog(
      {String title,
      String content,
      Function yesOnPressed,
      Color color,
      Function noOnPressed,
      bool showNoButton = true,
      bool showYesButton = true,
      String yes = "Yes",
      String no = "No"}) {
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25,
          ),
          Icon(
            Icons.check_circle,
            color: yellow,
            size: 60,
          ),
          SizedBox(
            height: 38,
          ),
          TextViewWidget(
            text: 'Product ID: F4352',
            textSize: 18,
            textAlign: TextAlign.left,
            maxLines: 1,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: TextViewWidget(
              text: 'NGN 100 will be deducted from your wallet to place bid',
              textSize: 14,
              textAlign: TextAlign.center,
              maxLines: 1,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Container(
            width: getWidth(context) / 2,
            child: BidCustomButtonWidget(
              onPressed: _yesOnPressed,
              color: yellow,
              textColor: white,
              text: 'Confirm',
              splashColor: yellowSplash,
            ),
          ),
          Container(
            width: getWidth(context) / 2,
            child: BidCustomButtonWidget(
              onPressed: _noOnPressed,
              color: black,
              textColor: white,
              text: 'Cancel',
              splashColor: black1,
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomCircleAlertDialog extends StatelessWidget {
  Function _yesOnPressed;
  Function _noOnPressed;
  String _content;

  CustomCircleAlertDialog(
      {String title,
      @required String content,
      Function yesOnPressed,
      Color color,
      Function noOnPressed,
      bool showNoButton = true,
      bool showYesButton = true,
      String yes = "Yes",
      String no = "No"}) {
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;
    this._content = content;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: black.withOpacity(0.6)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageLoader(
              path: tick,
            ),
            SizedBox(
              height: 10,
            ),
            TextViewWidget(
              text: _content,
              textSize: 16,
              textAlign: TextAlign.center,
              color: white,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
          ],
        ),
      ),
    );
  }
}
