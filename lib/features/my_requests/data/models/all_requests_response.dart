class AllRequestsResponse {
  List<RequestDataModel> data;
  String type;

  AllRequestsResponse({required this.data, required this.type});

  factory AllRequestsResponse.fromJson(Map<String, dynamic> json) {
    return AllRequestsResponse(
      data: List<RequestDataModel>.from(
          json["data"].map((item) => RequestDataModel.fromJson(item))),
      type: json['type'].toString(),
    );
  }
}

class RequestDataModel {
  int id;
  String note;
  int type;
  int active;
  String date;

  RequestDataModel({
    required this.id,
    required this.note,
    required this.type,
    required this.active,
    required this.date,
  });

  factory RequestDataModel.fromJson(Map<String, dynamic> json) {
    return RequestDataModel(
      id: json['id'],
      note: json['note']??"",
      type: json['type']??"",
      active: json['active']??"0",
      date: json['date']??"",
    );
  }
}
