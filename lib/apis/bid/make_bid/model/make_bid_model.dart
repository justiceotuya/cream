class GetBidModel {
  bool status;
  String message;
  List<Data> data;

  GetBidModel({this.status, this.message, this.data});

  GetBidModel.fromJson(Map<String, dynamic> json) {
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
