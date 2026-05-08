class CreateOrderResponseModel {
  final bool status;
  final String message;
  final int orderId;
  final int code;

  CreateOrderResponseModel({
    required this.status,
    required this.message,
    required this.orderId,
    required this.code,
  });

  factory CreateOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      orderId: json['data']?['id'] ?? 0,
      code: json['code'] ?? 0,
    );
  }
}