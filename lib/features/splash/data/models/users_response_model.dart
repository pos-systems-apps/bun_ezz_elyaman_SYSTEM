class UsersResponseModel {
  final bool status;
  final String message;
  final List<CustomerModel> data;
  final int code;

  UsersResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<CustomerModel>.from(
              json['data'].map((item) => CustomerModel.fromJson(item)),
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

class CustomerModel {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String classification;
  final String classificationLabel;
  final String balance;
  final dynamic area;

  CustomerModel({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.latitude,
    this.longitude,
    required this.classification,
    required this.classificationLabel,
    required this.balance,
    this.area,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      classification: json['classification'] ?? '',
      classificationLabel: json['classification_label'] ?? '',
      balance: json['balance'] ?? '0.00',
      area: json['area'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'classification': classification,
      'classification_label': classificationLabel,
      'balance': balance,
      'area': area,
    };
  }
}
