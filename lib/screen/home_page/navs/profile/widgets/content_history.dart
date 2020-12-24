import 'package:cream_platform_app/apis/content/personal/provider/history_providers.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bid_frag.dart';

class ContentHistory extends StatelessWidget {
  List<DropdownMenuItem<ListItem>> dropdownMenuItems;
  ListItem selectedItem;
  ValueChanged<ListItem> onChanged;

  ContentHistory({
    @required this.dropdownMenuItems,
    @required this.selectedItem,
    @required this.contentHistoryProviders,
    @required this.onChanged,
  });

  ContentHistoryProviders contentHistoryProviders;


  @override
  Widget build(BuildContext context) {
    return Consumer<ContentHistoryProviders>(
        builder: (_, provider, __) => Container(
              color: grey2.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextViewWidget(
                        text: 'Type',
                        textSize: 14,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        color: black,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: white,
                            border: Border.all(color: borderColor)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: selectedItem,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 12,
                              ),
                              items: dropdownMenuItems,
                              onChanged: onChanged),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 130,
                    child: ListView(
                      controller: provider.scrollController,
                      scrollDirection: Axis.horizontal,
                      children: provider.data.map((data) {
                        if (selectedItem.name == 'ALL') {
                          return Row(
                            children: [
                              Container(
                                height: 67,
                                width: 67,
                                decoration: BoxDecoration(
                                    color: black,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: getWidth(context) * 0.1,
                                          child: TextViewWidget(
                                            text: '${data?.name ?? ''}',
                                            textSize: 10,
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
                                            text: 'Sub title',
                                            textSize: 10,
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                            color: textColor1,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  B('Hide', black, white),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  B('Promote', white, black),
                                ],
                              )
                            ],
                          );
                        }
                        return selectedItem.name == data.type
                            ? Row(
                                children: [
                                  Container(
                                    height: 67,
                                    width: 67,
                                    decoration: BoxDecoration(
                                        color: black,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: getWidth(context) * 0.1,
                                              child: TextViewWidget(
                                                text: '${data?.name ?? ''}',
                                                textSize: 10,
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
                                                text: 'Sub title',
                                                textSize: 10,
                                                textAlign: TextAlign.left,
                                                maxLines: 1,
                                                color: textColor1,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      B('Hide', black, white),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      B('Promote', white, black),
                                    ],
                                  )
                                ],
                              )
                            : Container();
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class B extends StatelessWidget {
  final String t;
  final Color color;
  final Color textColor;

  B(this.t, this.color, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(3), color: color),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: TextViewWidget(
            text: t,
            textSize: 10,
            textAlign: TextAlign.center,
            maxLines: 1,
            color: textColor,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
