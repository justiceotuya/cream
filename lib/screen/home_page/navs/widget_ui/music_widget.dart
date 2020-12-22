import 'package:cream_platform_app/apis/content/create/model/create_model.dart';
import 'package:cream_platform_app/apis/content/create/provider/create_providers.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicWidget extends StatefulWidget {
  @override
  _MusicWidgetState createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  final TextEditingController _songTitleController = TextEditingController();
  final TextEditingController _artisteController = TextEditingController();
  final TextEditingController _yearReleasedController = TextEditingController();
  final TextEditingController _recordLabelController = TextEditingController();

  bool _songTitleError = false;
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
          controller: _songTitleController,
          hint: 'Song title',
          err: 'Whats title of this song?',
          isValidationError: _songTitleError,
          textInputType: TextInputType.text,
          textCallBack: (_) => setState(() => _songTitleError = false),
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: _artisteController,
          hint: 'Artiste name(s)',
          err: 'Whats the name of the artiste?',
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
                hint: 'Year released',
                err: 'What year was this song released?',
                isValidationError: _yearReleaseError,
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
                hint: 'Record label',
                err: 'Whats the record label of this song',
                isValidationError: _recordLabelError,
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
          hint: 'Album cover (optional)',
          err: '',
          chooseButtonHint: 'Only Mp3 format is supported',
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
          hint: 'Song in mp3 or wav',
          err: 'Please pick your music',
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
              category: 'MP3',
              type: 'MUSIC',
              description: 'This is my new music',
              name: _songTitleController.text));
  }

  bool _validateData() {
    if (_songTitleController.text.isEmpty) {
      setState(() => _songTitleError = true);
      return false;
    }
    if (_artisteController.text.isEmpty) {
      setState(() => _artisteError = true);
      return false;
    }
    return true;
  }
}
