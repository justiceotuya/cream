import 'package:cream_platform_app/apis/content/create/model/create_model.dart';
import 'package:cream_platform_app/apis/content/create/provider/create_providers.dart';
import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final TextEditingController _imageTitleController = TextEditingController();
  final TextEditingController _artisteController = TextEditingController();
  final TextEditingController _yearTakenController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _imageTitleError = false;
  bool _artisteError = false;
  bool _yearTakenError = false;
  bool _descriptionError = false;

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
          controller: _imageTitleController,
          hint: 'Image title',
          err: 'Whats the title of this image?',
          isValidationError: _imageTitleError,
          textCallBack: (_) => setState(() => _imageTitleError = false),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: _artisteController,
          hint: 'Owner name',
          err: 'Whats the artiste name?',
          isValidationError: _artisteError,
          textCallBack: (_) => setState(() => _artisteError = false),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: _yearTakenController,
          hint: 'Year taken',
          err: 'Whats year was this image taken?',
          isValidationError: _yearTakenError,
          textCallBack: (_) => setState(() => _yearTakenError = false),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'Image',
          err: '',
          chooseButtonHint: 'Only Jpg format is supported',
          showChoosButton: true,
          onTap: () => _uploadContent(),
          isEnabled: false,
          style: TextStyle(fontStyle: FontStyle.italic),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: _descriptionController,
          hint: 'Brief description',
          err: 'Please give a concised description of your image.',
          isValidationError: _descriptionError,
          textCallBack: (_) => setState(() => _descriptionError = false),
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
              category: 'JPG',
              type: 'IMAGE',
              description: 'This is my new image',
              name: _imageTitleController.text));
  }

  bool _validateData() {
    if (_imageTitleController.text.isEmpty) {
      setState(() => _imageTitleError = true);
      return false;
    }
    if (_artisteController.text.isEmpty) {
      setState(() => _artisteError = true);
      return false;
    }
    if (_descriptionController.text.isEmpty) {
      setState(() => _descriptionError = true);
      return false;
    }
    return true;
  }
}
