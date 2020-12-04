import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/custom_expansion_tile.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

import 'widget/loan.dart';
import 'widget/subscription.dart';
import 'widget/transfer.dart';
import 'widget/withdraw.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool _status = false;
  bool _withdraw = false;
  bool _transfer = false;
  bool _airtimeOrData = false;
  bool _loan = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(29.0),
            child: Column(
              children: [
                TextViewWidget(
                  text: 'Wallet',
                  textSize: 12,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  color: black2,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
                SizedBox(
                  height: 10,
                ),
                TextViewWidget(
                  text: getNairaSign(context, 0),
                  textSize: 24,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  color: black,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
                SizedBox(
                  height: 10,
                ),
                TextViewWidget(
                  text: 'Enter Amount',
                  textSize: 12,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  color: textColor1,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
                Container(
                  width: getWidth(context) / 2,
                  child: EditTextWidget(
                    controller: null,
                    hint: '',
                    err: '',
                    textInputType: TextInputType.text,
                  ),
                ),
                Container(
                  width: getWidth(context) / 2,
                  child: BidCustomButtonWidget(
                    onPressed: () {},
                    color: yellow,
                    textColor: white,
                    textSize: 14,
                    text: 'Top up with NGN 1,000',
                    splashColor: yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        CustomExpansionTile(
          title: 'Subscription Status',
          isOpened: _status,
          onTap: () => setState(() => _status = !_status),
        ),
        Visibility(
            visible: _status,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Suscription(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Divider(
          thickness: 0.5,
        ),
        CustomExpansionTile(
          title: 'Withdraw to Bank',
          isOpened: _withdraw,
          onTap: () => setState(() => _withdraw = !_withdraw),
        ),
        Visibility(
            visible: _withdraw,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Withdraw(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Divider(
          thickness: 0.5,
        ),
        CustomExpansionTile(
          title: 'Buy Airtime or Data',
          isOpened: _airtimeOrData,
          onTap: () => setState(() => _airtimeOrData = !_airtimeOrData),
        ),
        Visibility(
            visible: _airtimeOrData,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Divider(
          thickness: 0.5,
        ),
        CustomExpansionTile(
          title: 'Apply for Loan',
          isOpened: _loan,
          onTap: () => setState(() => _loan = !_loan),
        ),
        Visibility(
            visible: _loan,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Loan(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
      ],
    );
  }
}
