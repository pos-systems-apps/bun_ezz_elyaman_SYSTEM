class SuccessResponseModel {
  final String? message;

  const SuccessResponseModel({
    required this.message,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SuccessResponseModel(
        message: json["message"] ?? "",
      );
}
