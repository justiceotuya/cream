class FailedOrNormalResponsesModel {
  bool status;
  String message;
  Null data;

  FailedOrNormalResponsesModel({this.status, this.message, this.data});

  FailedOrNormalResponsesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? null;
    message = json['message'] ?? null;
    data = json['data'] ?? null;
  }

}
