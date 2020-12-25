import 'package:cream_platform_app/apis/content/personal/database/content_history_dao.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// initialize local data storage
Future<void> initialize() async {
  await Hive.initFlutter();
  await HiveBoxes.openAllBox();
}

class HiveBoxes {
  static final contentHistory = 'contentHistory';

  static Future openAllBox() async {
    contentHistoryDao = ContentHistoryDao();
  }

  static Future<Box<T>> openBox<T>(String boxName) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
    } else {
      try {
        box = await Hive.openBox<T>(boxName);
      } catch (_) {
        await Hive.deleteBoxFromDisk(boxName);
        box = await Hive.openBox<T>(boxName);
      }
    }

    return box;
  }

  static Future<void> closeBox<T>(String boxName) async {
    Box box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
      box.close();
    }
  }

  static void clearData() {
    _clearBox<Map<String, dynamic>>(contentHistory);
  }

  static _clearBox<T>(String name) async {
    try {
      print('clearing box $name');
      final Box<T> _box = await openBox<T>(name);
      await _box?.clear();
    } catch (_) {
      print('clear $name error: ${_.toString()}');
    }
  }
}
