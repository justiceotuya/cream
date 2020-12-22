import 'package:cream_platform_app/apis/content/create/provider/create_providers.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/custom_no_padding_check_box.dart';
import 'package:cream_platform_app/screen/ui/custom_no_padding_radio_button_widget.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget_ui/file_widget.dart';
import 'widget_ui/image_widget.dart';
import 'widget_ui/music_widget.dart';
import 'widget_ui/video_widget.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isMusic = true;
  bool _isVideo = false;
  bool _isImage = false;
  bool _isFile = false;
  int _widget = 1;
  bool _isChecked = false;
  CreateContentsProviders _contentsProviders;

  @override
  void initState() {
    _contentsProviders =
        Provider.of<CreateContentsProviders>(context, listen: false);
    super.initState();
  }

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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Content Type',
                      style: TextStyle(color: black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' (tick appropriate)',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: grey,
                              fontSize: 12),
                        )
                      ]),
                ),
                SizedBox(
                  height: 23,
                ),
                Row(
                  children: [
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'Music',
                            isMarked: _isMusic,
                            onChange: (bool val) => _switchState(1))),
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'Video',
                            isMarked: _isVideo,
                            onChange: (bool val) => _switchState(2))),
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'Image',
                            isMarked: _isImage,
                            onChange: (bool val) => _switchState(3))),
                    Expanded(
                        child: NoPaddingRadioButton(
                            title: 'File',
                            isMarked: _isFile,
                            onChange: (bool val) => _switchState(4))),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                BodyWidget(_widget),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NoPaddingCheckbox(
                        isMarked: _isChecked,
                        onChange: (bool val) =>
                            setState(() => _isChecked = val)),
                    SizedBox(
                      width: 6,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Accept',
                          style: TextStyle(color: black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' terms and condition',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: blue,
                                  fontSize: 14),
                            )
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _switchState(int i) {
    setState(() {
      _widget = i;
      if (i == 1) {
        _isMusic = true;
        _isVideo = false;
        _isImage = false;
        _isFile = false;
      }

      if (i == 2) {
        _isMusic = false;
        _isVideo = true;
        _isImage = false;
        _isFile = false;
      }

      if (i == 3) {
        _isMusic = false;
        _isVideo = false;
        _isImage = true;
        _isFile = false;
      }

      if (i == 4) {
        _isMusic = false;
        _isVideo = false;
        _isImage = false;
        _isFile = true;
      }
    });
  }
}

// ignore: must_be_immutable
class BodyWidget extends StatelessWidget {
  int id;

  BodyWidget(this.id);

  @override
  Widget build(BuildContext context) {
    if (id == 1) return MusicWidget();
    if (id == 2) return VideoWidget();
    if (id == 3) return ImageWidget();
    if (id == 4) return FileWidget();
    return Container();
  }
}
