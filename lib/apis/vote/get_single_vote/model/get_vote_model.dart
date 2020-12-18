class GetSingleVoteModel {
  bool status;
  String message;
  List<Data> data;

  GetSingleVoteModel({this.status, this.message, this.data});

  GetSingleVoteModel.fromJson(Map<String, dynamic> json) {
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
  int contentId;
  String phone;
  Null email;
  int createdAt;

  Data({this.id, this.contentId, this.phone, this.email, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contentId = json['contentId'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contentId'] = this.contentId;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
