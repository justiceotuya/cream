import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  final Function(String value) textCallBack;
  final String hintText;
  final ValueChanged<String> onChanged;
  bool showSearchIcon;

  SearchBoxWidget(
      {@required this.hintText,
      this.onChanged,
      this.showSearchIcon = true,
      @required this.textCallBack,
      this.editingController});

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: textHint),
      child: Row(
        children: <Widget>[
          ImageLoader(
            path: iconSearch,
          ),
          Flexible(
            flex: 7,
            child: TextFormField(
              controller: editingController,
              cursorColor: black,
              keyboardType: TextInputType.text,
              style: TextStyle(color: hint),
              onChanged: onChanged,
              decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: hint),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
