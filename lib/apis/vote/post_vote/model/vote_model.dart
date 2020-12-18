import 'package:flutter/cupertino.dart';

class PostAVoteModel {
  bool status;
  String message;
  Data data;

  PostAVoteModel({this.status, this.message, this.data});

  PostAVoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

 static Map<String, dynamic> toJson({@required String code, @required String phone, @required bool unique}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['phone'] = phone;
    data['unique'] = unique;
    return data;
  }
}

class Data {
  int id;
  String phone;
  int userId;
  int contentId;
  String message;
  String badge;
  int createdAt;
  int updatedAt;

  Data(
      {this.id,
        this.phone,
        this.userId,
        this.contentId,
        this.message,
        this.badge,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    userId = json['userId'];
    contentId = json['contentId'];
    message = json['message'];
    badge = json['badge'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['userId'] = this.userId;
    data['contentId'] = this.contentId;
    data['message'] = this.message;
    data['badge'] = this.badge;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
