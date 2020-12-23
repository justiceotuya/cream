import 'package:flutter/foundation.dart';

class ChangePasswordModel {
  bool status;
  String message;
  Null data;

  ChangePasswordModel({this.status, this.message, this.data});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  static Map<String, dynamic> toJson({
    @required String currentPassword,
    @required String newPassword,
    @required String confirmPassword,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPassword'] = currentPassword;
    data['newPassword'] = newPassword;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
