class LoginResponseModel {
  final bool status;
  final String message;
  final LoginDataModel data;
  final int code;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: LoginDataModel.fromJson(json['data'] ?? {}),
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
      'code': code,
    };
  }
}

class LoginDataModel {
  final String token;
  final DelegateModel delegate;

  LoginDataModel({
    required this.token,
    required this.delegate,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      token: json['token'] ?? '',
      delegate: DelegateModel.fromJson(json['delegate'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'delegate': delegate.toJson(),
    };
  }
}

class DelegateModel {
  final int id;
  final String name;
  final String email;
  final String phone;

  DelegateModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory DelegateModel.fromJson(Map<String, dynamic> json) {
    return DelegateModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}