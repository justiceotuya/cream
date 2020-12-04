import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class MessageMockUp {
  String image;
  String name;
  String message;

  MessageMockUp(this.image, this.name, this.message);

  static List<MessageMockUp> getMessage() {
    List<MessageMockUp> _messages = List<MessageMockUp>();

    MessageMockUp _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    _m = MessageMockUp(
        'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
        'Jaycee',
        'Wonderful songlist');
    _messages.add(_m);
    return _messages;
  }
}

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchBoxWidget(
            hintText: 'Type name of any artiste or song title',
            textCallBack: null),
        SizedBox(
          height: 38,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: MessageMockUp.getMessage()
              .map((e) => InkWell(
                    onTap: () => print('ASASA'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CircleImageLoader(
                                width: 35,
                                height: 35,
                                path: e.image,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextViewWidget(
                                    text: e.name,
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
                                    text: e.message,
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
                          height: 8,
                        ),
                        Divider(
                          thickness: 0.8,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
