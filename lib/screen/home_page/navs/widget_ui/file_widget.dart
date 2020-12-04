import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';

class FileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditTextWidget(
          controller: null,
          hint: 'File name',
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
          hint: 'File',
          err: '',
          chooseButtonHint: 'Only PDF format is supported',
          showChoosButton: true,
          onTap: () {},
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
          onTap: () {},
          style: TextStyle(fontStyle: FontStyle.italic),
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
