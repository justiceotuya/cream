import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditTextWidget(
          controller: null,
          hint: 'Image title',
          err: '',
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'Owner name',
          err: '',
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'Year taken',
          err: '',
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
          onTap: () {},
          isEnabled: false,
          style: TextStyle(fontStyle: FontStyle.italic),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'Brief description',
          err: '',
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
