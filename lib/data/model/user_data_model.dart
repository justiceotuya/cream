import 'package:flutter/foundation.dart';

class UserDataModel {
  int id;
  String token;
  String firstName;
  String lastName;
  String phone;
  String email;
  String sex;
  String address;
  String state;
  String type;
  String status;

  UserDataModel({
    @required this.id,
    @required this.token,
    @required this.firstName,
    @required this.lastName,
    @required this.phone,
    @required this.email,
    @required this.sex,
    @required this.address,
    @required this.state,
    @required this.type,
    @required this.status,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    sex = json['sex'];
    address = json['address'];
    state = json['state'];
    type = json['type'];
    status = json['status'];
  }

  static Map<String, dynamic> toJson(UserDataModel instance) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = instance.id;
    data['token'] = instance.token;
    data['firstName'] = instance.firstName;
    data['lastName'] = instance.lastName;
    data['phone'] = instance.phone;
    data['email'] = instance.email;
    data['sex'] = instance.sex;
    data['address'] = instance.address;
    data['state'] = instance.state;
    data['type'] = instance.type;
    data['status'] = instance.status;
    return data;
  }
}
