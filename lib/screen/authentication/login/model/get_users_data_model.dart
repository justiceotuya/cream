class GetUsersDataModel {
  bool status;
  String message;
  Data data;

  GetUsersDataModel({this.status, this.message, this.data});

  GetUsersDataModel.fromJson(Map<String, dynamic> json) {
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
  String firstName;
  String lastName;
  String phone;
  String email;
  String sex;
  String address;
  String state;
  String type;
  String status;
  int createdAt;
  int updatedAt;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.sex,
      this.address,
      this.state,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    sex = json['sex'];
    address = json['address'];
    state = json['state'];
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['sex'] = this.sex;
    data['address'] = this.address;
    data['state'] = this.state;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
