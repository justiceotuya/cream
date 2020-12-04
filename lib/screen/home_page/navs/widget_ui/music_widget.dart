import 'package:cream_platform_app/screen/ui/input_widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';

class MusicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditTextWidget(
          controller: null,
          hint: 'Song title',
          err: '',
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10,
        ),
        EditTextWidget(
          controller: null,
          hint: 'Artiste name(s)',
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
                hint: 'Year released',
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
                hint: 'Record label',
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
