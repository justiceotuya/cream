import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helper.dart';
import 'setting_item.dart';
import 'setting_style.dart';

class SettingRadioValue<T> {
  final String title;
  final T value;

  SettingRadioValue(this.title, this.value);
}

class SettingRadioItem<T> extends StatelessWidget {
  final String title;
  final String displayValue;
  final T selectedValue;

  final List<SettingRadioValue<T>> items;
  final ValueChanged<T> onChanged;
  final String cancelText;
  final ItemPriority priority;

  const SettingRadioItem({
    Key key,
    @required this.title,
    @required this.items,
    @required this.onChanged,
    this.displayValue,
    this.selectedValue,
    this.cancelText,
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      priority: priority,
      title: title,
      displayValue: displayValue,
      onTap: () async {
        var changedValue = await showDialog(
          context: context,
          builder: (_) => SimpleDialog(
            title: Text(title),
            children: [
              ...items
                  .map((e) => RadioListTile(
                        autofocus: true,
                        selected: e.value == selectedValue,
                        dense: true,
                        title: Text(e.title, style: TextStyle(fontSize: 14.0)),
                        value: e.value,
                        onChanged: (value) =>
                            Navigator.of(context, rootNavigator: true)
                                .pop(e.value),
                        groupValue: selectedValue,
                      ))
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        child: Text(cancelText ?? 'Cancel'),
                        onPressed: () => Navigator.pop(context)),
                  ],
                ),
              ),
            ],
          ),
        );
        if (changedValue != null) {
          onChanged(changedValue);
        }
      },
    );
  }
}

Future<void> showOptionsDialog<T>(
    {@required BuildContext context,
    @required String title,
    @required List<SettingRadioValue<T>> items,
    @required ValueChanged<T> onChanged,
    @required String displayValue,
    T selectedValue}) async {
  return await showDialog(
    context: context,
    builder: (_) => SimpleDialog(
      title: TextViewWidget(
        text: title,
        fontWeight: FontWeight.w600,
        textSize: 16,
        textAlign: TextAlign.left,
      ),
      children: [
        ...items
            .map((e) => RadioListTile(
                  autofocus: false,
                  selected: e.value == selectedValue,
                  dense: true,
                  title: Text(e.title, style: TextStyle(fontSize: 14.0)),
                  value: e.value,
                  onChanged: onChanged,
                  groupValue: selectedValue,
                ))
            .toList(),
      ],
    ),
  );
}

Future<void> showConfirmDialog({
  @required BuildContext context,
  @required String alertTitle,
  @required String alertMessage,
  @required VoidCallback negative,
  @required VoidCallback positive,
}) async {
  await showDialog(
      context: context,
      child: AlertDialog(
        title: Text(alertTitle),
        content: Column(
          children: [
            Text(alertMessage),
          ],
        ),
        actions: <Widget>[
          FlatButton(child: Text('Cancel'), onPressed: negative),
          FlatButton(child: Text('Contribute'), onPressed: positive)
        ],
      ));
}

Future<void> showEntryFieldDialog({
  @required BuildContext context,
  @required String title,
  @required String hintText,
  String initialValue,
  @required dynamic onChanged(val, ctx),
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext c) {
      var controller = TextEditingController(text: initialValue);
      return AlertDialog(
        title: Text(title),
        contentPadding: const EdgeInsets.all(16.0),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(hintText: hintText),
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
              child: const Text('Cancel'),
              onPressed: () => PageRouter.goBack(c)),
          FlatButton(
              child: const Text('OK'),
              onPressed: () => onChanged(controller.text, c))
        ],
      );
    },
  );
}

Future<void> showNonGenericOptionsDialog(
    {@required BuildContext context,
    @required String title,
    @required List<SettingRadioValue> items,
    @required dynamic onChanged(val, ctx),
    @required String displayValue,
    dynamic selectedValue}) async {
  return await showDialog(
    context: context,
    builder: (cx) => SimpleDialog(
      title: TextViewWidget(
        text: title,
        fontWeight: FontWeight.w600,
        textSize: 16,
        textAlign: TextAlign.left,
      ),
      children: [
        ...items
            .map((e) => RadioListTile(
                  autofocus: false,
                  selected: e.value == selectedValue,
                  dense: true,
                  title: Text(e.title, style: TextStyle(fontSize: 14.0)),
                  value: e.value,
                  onChanged: (v) => onChanged(v, cx),
                  groupValue: selectedValue,
                ))
            .toList(),
      ],
    ),
  );
}

pickDate(
    {@required BuildContext context,
    @required DateTime dateTime,
    @required ValueChanged<String> onChange,
    @required ValueChanged<DateTime> onDateTimeChange}) async {
  final ThemeData theme = Theme.of(context);
  assert(theme.platform != null);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return _buildMaterialDatePicker(
          context: context,
          currentDateTime: dateTime,
          date: onChange,
          dateTime: onDateTimeChange);
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return _buildCupertinoDatePicker(
          context: context,
          currentDateTime: dateTime,
          date: onChange,
          dateTime: onDateTimeChange);
  }
}

/// This builds material date picker in Android
void _buildMaterialDatePicker(
    {@required BuildContext context,
    @required DateTime currentDateTime,
    @required var date,
    @required var dateTime}) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: currentDateTime,
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light(),
        child: child,
      );
    },
  );
  if (picked != null && picked != date) {
    date(DateFormat("dd-MM-yyyy").format(picked));
    dateTime(picked);
  }
}

/// This builds cupertion date picker in iOS
void _buildCupertinoDatePicker(
    {@required BuildContext context,
    @required DateTime currentDateTime,
    @required var date,
    @required var dateTime}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Theme(
            data: ThemeData.light(),
            child: Container(
              height: getHeight(context) / 3,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                backgroundColor: Theme.of(context).cardColor,
                onDateTimeChanged: (picked) {
                  if (picked != null && picked != date) {
                    date(DateFormat("dd-MM-yyyy").format(picked));
                    dateTime(picked);
                  }
                },
                initialDateTime: currentDateTime,
                minimumYear: 2000,
                maximumYear: 2025,
              ),
            ));
      });
}
