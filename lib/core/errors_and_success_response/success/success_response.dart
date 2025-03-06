class SuccessResponseModel {
  final String? status;
  final int? orderId;
  final int? id;
  final String? message;

  const SuccessResponseModel({
    required this.status,
    required this.orderId,
    required this.id,
    required this.message,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SuccessResponseModel(
        status: json["status"],
        id: json["id"],
        orderId: json["order_id"],
        message: json["message"],
      );
}
