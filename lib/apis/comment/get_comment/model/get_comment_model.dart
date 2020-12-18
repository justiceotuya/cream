class GetCommentModel {
  bool status;
  String message;
  List<Data> data;

  GetCommentModel({this.status, this.message, this.data});

  GetCommentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
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
