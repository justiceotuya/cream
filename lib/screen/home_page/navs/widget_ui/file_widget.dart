import 'package:cream_platform_app/apis/content/create/model/create_model.dart';
import 'package:cream_platform_app/apis/content/create/provider/create_providers.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FileWidget extends StatefulWidget {
  @override
  _FileWidgetState createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  final TextEditingController _fileTitleController = TextEditingController();
  final TextEditingController _artisteController = TextEditingController();
  final TextEditingController _fileDescriptionController =
      TextEditingController();

  bool _fileTitleError = false;
  bool _artisteError = false;
  bool _fileDescriptionError = false;

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
          controller: _fileTitleController,
          hint: 'File name',
          err: 'Whats the name of this file?',
          textCallBack: (_) => setState(() => _fileTitleError = false),
          isValidationError: _fileTitleError,
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: _artisteController,
          hint: 'Owner name',
          err: 'Whats the name of the file Owner?',
          textCallBack: (_) => setState(() => _artisteError = false),
          isValidationError: _artisteError,
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'File',
          err: '',
          chooseButtonHint: 'Only PDF format is supported',
          showChoosButton: true,
          onTap: () => _uploadContent(),
          style: TextStyle(fontStyle: FontStyle.italic),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          fieldHeight: 100,
          hint: 'Brief description',
          err: '',
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
              category: 'PDF',
              type: 'DOCUMENT',
              description: 'This is my new document',
              name: _fileTitleController.text));
  }

  bool _validateData() {
    if (_fileTitleController.text.isEmpty) {
      setState(() => _fileTitleError = true);
      return false;
    }
    if (_artisteController.text.isEmpty) {
      setState(() => _artisteError = true);
      return false;
    }
    return true;
  }
}
