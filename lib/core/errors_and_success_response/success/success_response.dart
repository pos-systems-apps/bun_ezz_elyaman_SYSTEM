class SuccessResponseModel {
  final String? message;
  final int? orderID;

  const SuccessResponseModel({
    required this.message,
    required this.orderID,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SuccessResponseModel(
        message: json["message"] ?? "",
        orderID: json["order_id"]?['data']?['id'] ,
      );
}
