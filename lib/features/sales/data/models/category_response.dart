class CategoryResponse {
  final bool status;
  final String message;
  final List<CategoryModel> data;
  final int code;

  CategoryResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<CategoryModel>.from(
              json['data'].map((item) => CategoryModel.fromJson(item)),
            )
          : [],
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
      'code': code,
    };
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String? image;

  CategoryModel({
    required this.id,
    required this.name,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
