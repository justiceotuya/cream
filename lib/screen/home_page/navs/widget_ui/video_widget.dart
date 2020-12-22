import 'package:cream_platform_app/apis/content/create/model/create_model.dart';
import 'package:cream_platform_app/apis/content/create/provider/create_providers.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoWidget extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  final TextEditingController _videoTitleController = TextEditingController();
  final TextEditingController _artisteController = TextEditingController();
  final TextEditingController _yearReleasedController = TextEditingController();
  final TextEditingController _recordLabelController = TextEditingController();

  bool _videoTitleError = false;
  bool _artisteError = false;
  bool _yearReleaseError = false;
  bool _recordLabelError = false;

  CreateContentsProviders _contentsProviders;

  @override
  void initState() {
    _contentsProviders =
        Provider.of<CreateContentsProviders>(context, listen: false);
    _contentsProviders.initialize(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditTextWidget(
          controller: _videoTitleController,
          hint: 'Video title',
          err: 'Whats this video title?',
          textInputType: TextInputType.text,
          isValidationError: _videoTitleError,
          textCallBack: (_) => setState(() => _videoTitleError = false),
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: _artisteController,
          hint: 'Owner name',
          err: 'Whats the artiste name?',
          isValidationError: _artisteError,
          textInputType: TextInputType.text,
          textCallBack: (_) => setState(() => _artisteError = false),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: EditTextWidget(
                controller: _yearReleasedController,
                hint: 'Year recorded',
                err: 'What year was this recorded?',
                textInputType: TextInputType.text,
                textCallBack: (_) => setState(() => _yearReleaseError = false),
              ),
            ),
            SizedBox(
              width: 27,
            ),
            Expanded(
              child: EditTextWidget(
                controller: _recordLabelController,
                hint: 'YouTube Link',
                err: 'Whats the Youtube link?',
                textInputType: TextInputType.text,
                textCallBack: (_) => setState(() => _recordLabelError = false),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'Video cover (optional)',
          err: '',
          chooseButtonHint: 'Only Mp4 format is supported',
          showChoosButton: true,
          isEnabled: false,
          onTap: () {},
          style: TextStyle(fontStyle: FontStyle.italic),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'Video in mp4',
          err: '',
          showChoosButton: true,
          isEnabled: false,
          onTap: () => _uploadContent(),
          style: TextStyle(fontStyle: FontStyle.italic),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  void _uploadContent() {
    if (_validateData())
      _contentsProviders.create(
          map: CreateModel.toJson(
              category: 'MP4',
              type: 'VIDEO',
              description: 'This is my new music video',
              name: _videoTitleController.text));
  }

  bool _validateData() {
    if (_videoTitleController.text.isEmpty) {
      setState(() => _videoTitleError = true);
      return false;
    }
    if (_artisteController.text.isEmpty) {
      setState(() => _artisteError = true);
      return false;
    }
    return true;
  }
}
