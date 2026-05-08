class CreateReturnResponseModel {
  final bool status;
  final String message;
  final ReturnDataModel? data;
  CreateReturnResponseModel({
    required this.status,
    required this.message,
    required this.data,
   });

  factory CreateReturnResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateReturnResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? ReturnDataModel.fromJson(json['data'])
          : null,
     );
  }
}

class ReturnDataModel {
  final int id;

  ReturnDataModel({
    required this.id,
  });

  factory ReturnDataModel.fromJson(Map<String, dynamic> json) {
    return ReturnDataModel(
      id: json['id'] ?? 0,
    );
  }



}