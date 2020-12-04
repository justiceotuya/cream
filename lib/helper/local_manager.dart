import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSourceProvider extends ChangeNotifier {
  /// initialize local data storage
  static Future<void> initialize() async {
    await Hive.initFlutter();

    // register adapters passing in the model class as its generic type e.g UsersLoanModel
    // and also passing the adapter  UsersLoanModelAdapter() as its argument
    /// Hive.registerAdapter<dynamic>(adapterHer);

    // open a box using the model class as its model class as its generic type
    // and passing in the box key as its argument
    /// await Hive.openBox<dynamic>(keyHere);
  }

  /// return true if such box has data
  Future<bool> hasData({@required String boxKey}) async {
    /// replace dynamic type with actual Object type as its generic type
    final _dataBox = Hive.box<dynamic>(boxKey);
    notifyListeners();
    return _dataBox.length > 0;
  }

  /// saves a list of data
  Future<void> saveData(
      {@required Iterable<dynamic> data, @required String key}) async {
    /// replace dynamic type with actual Object type as its generic type
    final _dataBox = Hive.box<dynamic>(key);
    final _dataMap = {for (var e in data) e.number: e};
    await _dataBox.clear();
    await _dataBox.putAll(_dataMap);
    notifyListeners();
  }

  /// get a list of data
  Future<List<dynamic>> getAllData({int page, int limit}) async {
    final _dataBox = Hive.box<dynamic>('');
    final _totalData = _dataBox.length;

    final _start = (page - 1) * limit;
    final newDataCount = min(_totalData - _start, limit);

    final _data =
        List.generate(newDataCount, (index) => _dataBox.getAt(_start + index));
    notifyListeners();
    return _data;
  }

  /// replace dynamic type with actual Object type as its generic type
  Future<dynamic> getData({@required String number}) async {
    /// replace dynamic type with actual Object type as its generic type
    final _dataBox = Hive.box<dynamic>('');
    notifyListeners();
    return _dataBox.get(number);
  }

  /// replace dynamic type with actual Object type as its generic type

  Future<List<dynamic>> getEvolutions(data) async {
    final _dataFutures = data.evolutions.map((num) => getData(number: num));

    final _data = await Future.wait(_dataFutures);
    notifyListeners();
    return _data;
  }
}
