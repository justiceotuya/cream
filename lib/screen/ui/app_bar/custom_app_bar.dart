import 'dart:io';

import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  String title;
  final VoidCallback onTap;

  CustomAppBarWidget(this.title, {@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                        icon: Icon(Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back),
                        onPressed: () => PageRouter.gotoWidget(
                            MyHomePage(bottomNavIndex: 8), context,
                            clearStack: true)),
                    TextViewWidget(
                      text: title,
                      textSize: 15,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: <Widget>[
                        ImageLoader(
                          path: notifications,
                        ),
                        Positioned(
                          right: 8.0,
                          top: 13.0,
                          child: Stack(
                            children: <Widget>[
                              Icon(
                                Icons.brightness_1,
                                size: 12.0,
                                color: red1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 23,
                    ),
                    CircleImageLoader(
                      width: 35,
                      height: 35,
                      path:
                          'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
                    ),
                    SizedBox(
                      width: 23,
                    ),
                    ImageLoader(
                      path: menu,
                      onTap: onTap,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ImageLoader(
                      path: wallet,
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextViewWidget(
                      text: 'Wallet Balance: ${getNairaSign(context, 0)}',
                      textSize: 12,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      color: textColor3,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextViewWidget(
                          text: 'Top up',
                          textSize: 12,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: black, borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            TextViewWidget(
                              text: 'Subscription : Active',
                              textSize: 12,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: green),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
