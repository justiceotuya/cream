class MakeBidModel {
  bool status;
  String message;
  Data data;

  MakeBidModel({this.status, this.message, this.data});

  MakeBidModel.fromJson(Map<String, dynamic> json) {
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
  String number;
  String status;
  int open;
  int close;
  int step;
  int min;
  int max;
  int createdAt;

  Data(
      {this.id,
      this.number,
      this.status,
      this.open,
      this.close,
      this.step,
      this.min,
      this.max,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    status = json['status'];
    open = json['open'];
    close = json['close'];
    step = json['step'];
    min = json['min'];
    max = json['max'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['status'] = this.status;
    data['open'] = this.open;
    data['close'] = this.close;
    data['step'] = this.step;
    data['min'] = this.min;
    data['max'] = this.max;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
