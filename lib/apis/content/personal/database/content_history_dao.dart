import 'dart:async';
import 'dart:convert';

import 'package:cream_platform_app/apis/content/personal/model/content_history_model.dart';
import 'package:cream_platform_app/database/hive_boxes.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

ContentHistoryDao contentHistoryDao;

class ContentHistoryDao {
  Box<Map> _box;

  Box<Map> get box => _box;

  ContentHistoryDao() {
    openGraphsBox().then((value) => {
          print('open box'),
          _box = value,
        });
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.contentHistory);
  }

  Future<void> saveAll(List<Data> loanData) async {
    final map = Map<String, Map>.fromIterable(
      loanData,
      key: (g) => (g as Data).id.toString(),
      value: (g) => (g as Data).toJson(),
    );
    _box.putAll(map);
  }

  Future<List<Data>> getAll() async {
    return _box.values.map((e) => Data.fromJson(e)).toList();
  }

  List<Data> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => Data.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box> getListenable({List<String> keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  void truncate() => _box?.clear();
}
