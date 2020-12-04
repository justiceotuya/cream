import 'package:flutter/cupertino.dart';

class GetTokenModel {
  bool status;
  String message;
  String data;

  GetTokenModel({this.status, this.message, this.data});

  GetTokenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  static Map<String, dynamic> toJson(
      {@required String phoneNumber, @required String password}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
