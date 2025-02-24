class SuccessResponseModel {
  final int? orderId;
  final String? message;

  const SuccessResponseModel({
    required this.orderId,
    required this.message,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SuccessResponseModel(
        orderId: json["order_id"],
        message: json["message"],
      );
}
