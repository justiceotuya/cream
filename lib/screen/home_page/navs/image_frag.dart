import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class Image extends StatefulWidget {
  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<Image> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: SearchBoxWidget(
              hintText: 'Type name of any artiste or song title',
              textCallBack: null),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ImageLoader(
            path: image,
            height: 15,
            width: 20,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: TextViewWidget(
            text: 'Top Pictures',
            textSize: 14,
            textAlign: TextAlign.left,
            maxLines: 1,
            color: black,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ImageLoader(
              path: rOne,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
            Expanded(
                child: ImageLoader(
              path: rTwo,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
            Expanded(
                child: ImageLoader(
              path: rThree,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ImageLoader(
              path: rFour,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
            Expanded(
                child: ImageLoader(
              path: rFive,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
            Expanded(
                child: ImageLoader(
              path: rSix,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ImageLoader(
              path: rFive,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
            Expanded(
                child: ImageLoader(
              path: rSix,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
            Expanded(
                child: ImageLoader(
              path: rFour,
              width: 100,
              height: 100,
              onTap: () => PageRouter.gotoWidget(
                  MyHomePage(bottomNavIndex: 14), context,
                  clearStack: true),
            )),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
