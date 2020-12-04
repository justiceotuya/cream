class FailedResponsesModel {
  bool status;
  String message;
  Null data;

  FailedResponsesModel({this.status, this.message, this.data});

  FailedResponsesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? null;
    message = json['message'] ?? null;
    data = json['data'] ?? null;
  }

}
