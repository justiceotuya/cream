import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:cream_platform_app/screen/ui/music_list.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
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
            path: music,
            height: 20,
            width: 20,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: TextViewWidget(
            text: 'Top Trending Songs',
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
            Expanded(child: MusicList(9)),
            SizedBox(
              width: 20,
            ),
            Expanded(child: MusicList(9)),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: MusicList(9)),
            SizedBox(
              width: 20,
            ),
            Expanded(child: MusicList(9)),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: MusicList(9)),
            SizedBox(
              width: 20,
            ),
            Expanded(child: MusicList(9)),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: MusicList(9)),
            SizedBox(
              width: 20,
            ),
            Expanded(child: MusicList(9)),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: MusicList(9)),
            SizedBox(
              width: 20,
            ),
            Expanded(child: MusicList(9)),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
