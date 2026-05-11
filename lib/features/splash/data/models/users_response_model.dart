class UsersResponseModel {
  final bool? status;
  final String? message;
  final List<UserModel>? data;
  final int? code;

  UsersResponseModel({
    this.status,
    this.message,
    this.data,
    this.code,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? List<UserModel>.from(
        json['data'].map((item) => UserModel.fromJson(item)),
      )
          : null,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
      'code': code,
    };
  }
}

class UserModel {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;
  final String? latitude;
  final String? longitude;
  final String? classification;
  final String? classificationLabel;
  final num? creditLimit;
  final num? openingBalance;
  final num? balance;
  final num? debt;
  final AreaModel? area;

  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.latitude,
    this.longitude,
    this.classification,
    this.classificationLabel,
    this.creditLimit,
    this.openingBalance,
    this.balance,
    this.debt,
    this.area,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      classification: json['classification'] as String?,
      classificationLabel: json['classification_label'] as String?,
      creditLimit: json['credit_limit'] as num?,
      openingBalance: json['opening_balance'] as num?,
      balance: json['balance'] as num?,
      debt: json['debt'] as num?,
      area: json['area'] != null ? AreaModel.fromJson(json['area']) : null,
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
      'credit_limit': creditLimit,
      'opening_balance': openingBalance,
      'balance': balance,
      'debt': debt,
      'area': area?.toJson(),
    };
  }
}

class AreaModel {
  final int? id;
  final String? name;

  AreaModel({
    this.id,
    this.name,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}