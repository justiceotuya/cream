import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:flutter/material.dart';

import 'text_view_widget.dart';

class MusicList extends StatelessWidget {
  int pageIndex;

  MusicList(this.pageIndex);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => PageRouter.gotoWidget(
          MyHomePage(bottomNavIndex: pageIndex), context,
          clearStack: true),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 67,
              width: 67,
              decoration: BoxDecoration(
                  color: black, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: getWidth(context) * 0.1,
                          child: TextViewWidget(
                            text: 'Title',
                            textSize: 8,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          width: getWidth(context) * 0.2,
                          child: TextViewWidget(
                            text: 'Chicky chizzy',
                            textSize: 8,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            color: textColor1,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.add,
                      color: grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(color: red, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow_sharp,
                      color: white,
                      size: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageLoader(
                    path: heart,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageLoader(
                    path: comment,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageLoader(
                    path: share,
                    width: 20,
                    height: 20,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
