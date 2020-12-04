import 'dart:math';

import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_edit_text_widget.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class ImagePlay extends StatefulWidget {
  @override
  _ImagePlayState createState() => _ImagePlayState();
}

class _ImagePlayState extends State<ImagePlay> {
  final List<double> values = [];
  bool _favourite = false;

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    for (var i = 0; i < 50; i++) {
      values.add(rng.nextInt(30) * 1.0);
    }
    return Material(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: SearchBoxWidget(
                hintText: 'Type name of any artiste or song title',
                textCallBack: null),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageLoader(
                path: rFive,
                width: 258,
                height: 258,
              ),
              SizedBox(
                height: 6,
              ),
              IconButton(
                  icon: _favourite
                      ? Icon(
                          Icons.favorite,
                          color: red,
                        )
                      : Icon(
                          Icons.favorite_border_outlined,
                          color: red,
                        ),
                  onPressed: () => setState(() => _favourite = !_favourite)),
              Container(
                margin: const EdgeInsets.only(left: 59, right: 59),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.skip_previous,
                      color: grey,
                      size: 40,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextViewWidget(
                          text: 'Pineaple',
                          textSize: 14,
                          textAlign: TextAlign.center,
                          color: textColor1,
                          maxLines: 1,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        TextViewWidget(
                          text: 'Jay Baby Art',
                          textSize: 12,
                          textAlign: TextAlign.center,
                          color: textColor1,
                          maxLines: 1,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.skip_next,
                      color: grey,
                      size: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          TextViewWidget(
            text: 'Content ID: 672D',
            textSize: 12,
            textAlign: TextAlign.center,
            color: textColor1,
            maxLines: 1,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 70, right: 70),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: grey,
                )),
            child: Row(
              children: [
                Container(
                  width: getWidth(context) * 0.5,
                  child: TextViewWidget(
                    text: 'http://creamplaform.com/noy',
                    textSize: 12,
                    textAlign: TextAlign.center,
                    color: textColor1,
                    maxLines: 1,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: getHeight(context),
                  width: 1,
                  color: grey,
                ),
                Expanded(
                  child: IconButton(
                      icon: Icon(
                        Icons.copy,
                        size: 18,
                        color: grey,
                      ),
                      onPressed: null),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: CircleImageLoader(
                  width: 35,
                  height: 35,
                  path:
                      'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
                ),
              ),
              Expanded(
                flex: 6,
                child: BidCustomEditTextWidget(
                  controller: null,
                  err: '',
                  hint: 'Add your comment',
                  fontSize: 12,
                  textAlign: TextAlign.left,
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1.2,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CircleImageLoader(
                  width: 35,
                  height: 35,
                  path:
                      'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextViewWidget(
                      text: 'Jaycee',
                      textSize: 14,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      color: black,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextViewWidget(
                      text: 'Wonderful song. Love it!',
                      textSize: 12,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      color: black,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
