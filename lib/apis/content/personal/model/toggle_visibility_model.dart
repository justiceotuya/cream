class ToggleVisibilityModel {
  bool status;
  String message;
  Data data;

  ToggleVisibilityModel({this.status, this.message, this.data});

  ToggleVisibilityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
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
  List<Null> tags;
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
    if (json['tags'] != null) {
      tags = new List<Null>();
      json['tags'].forEach((v) {
        //   tags.add(new Null.fromJson(v));
      });
    }
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
    if (this.tags != null) {
     // data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
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
