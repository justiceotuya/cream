import 'package:flutter/foundation.dart';

class ForgotPasswordModel {
  bool status;
  String message;
  Data data;

  ForgotPasswordModel({this.status, this.message, this.data});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  static Map<String, dynamic> toJson({@required String phone}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = phone;
    return data;
  }
}

class Data {
  int id;
  int userId;
  String code;
  int createdAt;
  int updatedAt;

  Data({this.id, this.userId, this.code, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    code = json['code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['code'] = this.code;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
