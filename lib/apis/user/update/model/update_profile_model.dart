import 'package:flutter/foundation.dart';

class UpdateProfileModel {
  bool status;
  String message;
  Null data;

  UpdateProfileModel({this.status, this.message, this.data});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  static Map<String, dynamic> toJson({
    @required String address,
    @required String email,
    @required String firstName,
    @required String lastName,
    @required String phone,
    @required String sex,
    @required String state,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = address;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['sex'] = sex;
    data['state'] = state;
    return data;
  }
}
