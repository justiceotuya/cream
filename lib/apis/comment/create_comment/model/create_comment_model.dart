import 'package:flutter/material.dart';

class CreateCommentModel {
  bool status;
  String message;
  Data data;

  CreateCommentModel({this.status, this.message, this.data});

  CreateCommentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  static Map<String, dynamic> toJson({
    String badge,
    int contentId,
    String createdAt,
    int id,
    @required String message,
    String phone,
    String updatedAt,
    int userId,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (badge != null) data['badge'] = badge;
    if (contentId != null) data['contentId'] = contentId;
    if (createdAt != null) data['createdAt'] = createdAt;
    data['message'] = message;
    if (phone != null) data['phone'] = phone;
    if (updatedAt != null) data['updatedAt'] = updatedAt;
    if (userId != null) data['userId'] = userId;
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
