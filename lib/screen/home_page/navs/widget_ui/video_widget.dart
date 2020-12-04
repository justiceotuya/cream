import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditTextWidget(
          controller: null,
          hint: 'Video title',
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
        Row(
          children: [
            Expanded(
              child: EditTextWidget(
                controller: null,
                hint: 'Year recorded',
                err: '',
                textInputType: TextInputType.text,
              ),
            ),
            SizedBox(
              width: 27,
            ),
            Expanded(
              child: EditTextWidget(
                controller: null,
                hint: 'YouTube Link',
                err: '',
                textInputType: TextInputType.text,
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
