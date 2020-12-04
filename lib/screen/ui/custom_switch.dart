import 'dart:io';

import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSwitch extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  bool value;

  CustomSwitch({@required this.onChanged, this.value = false});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Switch(
            value: value,
            inactiveTrackColor: grey,
            activeColor: green,
            onChanged: onChanged,
          )
        : CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            trackColor: grey,
            activeColor: green,
          );
  }
}
