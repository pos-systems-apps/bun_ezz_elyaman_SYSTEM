class SuccessResponseModel {
  final String? status;
  final int? orderId;
  final String? message;

  const SuccessResponseModel({
    required this.status,
    required this.orderId,
    required this.message,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SuccessResponseModel(
        status: json["status"],
        orderId: json["order_id"],
        message: json["message"],
      );
}
