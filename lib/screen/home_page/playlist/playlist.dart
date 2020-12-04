import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/route.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef callBack = void Function(String accountNumber, String bankName);

typedef callBackVoid = void Function();

class MusicPlaylistBottomSheet {
  final BuildContext context;
  final callBack account;
  final callBackVoid onDismiss;

  MusicPlaylistBottomSheet(
      {@required this.context, @required this.account, this.onDismiss});

  show() {
    showModalBottomSheet(
        context: context,
        clipBehavior: Clip.hardEdge,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
        ),
        builder: (builder) {
          return Container(
            height: getHeight(context) / 1.1,
            child: _MusicPlaylistBottomSheet(
              account,
              this.onDismiss,
            ),
          );
        });
  }
}

class _MusicPlaylistBottomSheet extends StatefulWidget {
  final callBack account;
  final callBackVoid onDismiss;

  _MusicPlaylistBottomSheet(
    this.account,
    this.onDismiss,
  );

  @override
  State<StatefulWidget> createState() {
    return __MusicPlaylistBottomSheetState(
      account,
      onDismiss,
    );
  }
}

class __MusicPlaylistBottomSheetState extends State<_MusicPlaylistBottomSheet> {
  final callBack account;
  final callBackVoid onDismiss;

  __MusicPlaylistBottomSheetState(
    this.account,
    this.onDismiss,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey4,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: black,
          ),
          onPressed: () => pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextViewWidget(
          text: 'My Playlist',
          textSize: 18,
          textAlign: TextAlign.left,
          maxLines: 1,
          color: black1,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Center(
              child: TextViewWidget(
                text: 'Go to music',
                textSize: 14,
                textAlign: TextAlign.left,
                maxLines: 1,
                onTap: () => pushReplace(
                    context: context, child: MyHomePage(bottomNavIndex: 6)),
                color: black1,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 89,
            width: getWidth(context),
            color: grey3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                          pushReplace(
                              context: context,
                              child: MyHomePage(bottomNavIndex: 7));
                        },
                        child: Container(
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: yellow),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextViewWidget(
                            text: 'Jay Baby',
                            textSize: 16,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            color: black1,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          TextViewWidget(
                            text: 'Jay Baby',
                            textSize: 12,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            color: black1,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.skip_previous_outlined,
                        size: 30,
                        color: white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.pause_circle_outline_outlined,
                        color: red,
                        size: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.skip_next_outlined,
                        size: 30,
                        color: white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextViewWidget(
                            text: 'Your songs',
                            textSize: 14,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            color: textColor1,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.repeat,
                            color: grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.shuffle,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextViewWidget(
                                text: 'Facility',
                                textSize: 16,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                color: black1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              TextViewWidget(
                                text: 'Cheeky Chizzy',
                                textSize: 12,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.clear,
                            color: grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.menu,
                            color: grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
