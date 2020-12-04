import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/custom_no_padding_radio_button_widget.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:cream_platform_app/screen/ui/music_list.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'Music',
                            isMarked: true,
                            onChange: (bool val) {})),
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'Video',
                            isMarked: false,
                            onChange: (bool val) {})),
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'Image',
                            isMarked: false,
                            onChange: (bool val) {})),
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'File',
                            isMarked: false,
                            onChange: (bool val) {})),
                  ],
                ),
                SizedBox(
                  height: 21,
                ),
                TextViewWidget(
                  text: 'Top Results',
                  textSize: 14,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  color: black,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
                SizedBox(
                  height: 21,
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
