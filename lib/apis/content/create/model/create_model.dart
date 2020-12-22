import 'package:flutter/cupertino.dart';

class CreateModel {
  bool status;
  String message;
  Data data;

  CreateModel({this.status, this.message, this.data});

  CreateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  static Map<String, dynamic> toJson({
    @required String category,
    @required String type,
    @required String description,
    @required String name,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (category != null) data['category'] = category;
    if (type != null) data['type'] = type;
    if (description != null) data['description'] = description;
    if (name != null) data['name'] = name;
    return data;
  }
}

class Data {
  int id;
  String name;
  String description;
  Null art;
  Null content;
  String category;
  Null tags;
  int userId;
  String type;
  String uniqueCode;
  Null publicUrl;
  bool isPublic;
  int likesCount;
  int createdAt;
  int updatedAt;

  Data(
      {this.id,
      this.name,
      this.description,
      this.art,
      this.content,
      this.category,
      this.tags,
      this.userId,
      this.type,
      this.uniqueCode,
      this.publicUrl,
      this.isPublic,
      this.likesCount,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    art = json['art'];
    content = json['content'];
    category = json['category'];
    tags = json['tags'];
    userId = json['userId'];
    type = json['type'];
    uniqueCode = json['uniqueCode'];
    publicUrl = json['publicUrl'];
    isPublic = json['isPublic'];
    likesCount = json['likesCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['art'] = this.art;
    data['content'] = this.content;
    data['category'] = this.category;
    data['tags'] = this.tags;
    data['userId'] = this.userId;
    data['type'] = this.type;
    data['uniqueCode'] = this.uniqueCode;
    data['publicUrl'] = this.publicUrl;
    data['isPublic'] = this.isPublic;
    data['likesCount'] = this.likesCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
