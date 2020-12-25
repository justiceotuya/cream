import 'package:cream_platform_app/apis/content/personal/provider/history_providers.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'text_view_widget.dart';

class CategoryWidget extends StatelessWidget {
  final String icon;
  final String catName;
  final String type;
  final VoidCallback onItemClicked;
  final VoidCallback onSeeAllTapped;

  CategoryWidget(
      {@required this.icon,
      @required this.catName,
      @required this.type,
      this.onItemClicked,
      this.onSeeAllTapped});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentHistoryProviders>(
        builder: (_, provider, __) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageLoader(
                          path: icon,
                        ),
                        TextViewWidget(
                          text: catName,
                          textSize: 14,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          color: red,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 14,
                          width: 1,
                          color: textColor4,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextViewWidget(
                          text: 'Recently Added',
                          textSize: 14,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          color: textColor4,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ],
                    ),
                    TextViewWidget(
                      onTap: () {},
                      text: 'See all',
                      textSize: 14,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      color: red,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
                Container(
                  width: getWidth(context),
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 2.0,
                          spreadRadius: 0.1),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: provider.data
                          .map((data) => data?.type != type ? Container() : Container(
                                margin: EdgeInsets.only(right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 67,
                                      width: 67,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: yellowSplash,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    TextViewWidget(
                                      text: data?.content ?? 'Content',
                                      textSize: 12,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      color: textColor1,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    TextViewWidget(
                                      text: data?.name ?? '',
                                      textSize: 10,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      color: textColor1,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ));
  }
}
