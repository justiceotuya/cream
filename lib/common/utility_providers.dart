import 'dart:convert';

import 'package:cream_platform_app/data/model/state_data_model.dart';
import 'package:cream_platform_app/data/model/user_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class UtilityProvider extends ChangeNotifier {
  static UserDataModel userData;
  static List<StateList> stateList = [];

  static Future<void> getListOfStates() async {
    final _response = await rootBundle.loadString('assets/json/states.json');
    var _states = json.decode(_response);
    List<dynamic> list = _states['states'];
    for (var map in list) {
      StateList _state = StateList(state: map['name']);
      stateList.add(_state);
      stateList.sort((a, b) => a.state.compareTo(b.state));
    }
  }
}
