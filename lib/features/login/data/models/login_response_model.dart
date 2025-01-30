class LoginResponseModel {
  int status;
  String message;
  String token;
  LoginResponseDataModel data;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
          status: json['status'],
          message: json['message'],
          token: json['token'],
          data: LoginResponseDataModel.fromJson(json['data']));
}

class LoginResponseDataModel {
  int id;
  String? name;
  String? email;
  String? address;
  String? type;
  String? avatar;
  String? phone;
  int isVerified;

  LoginResponseDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.type,
    required this.avatar,
    required this.phone,
    required this.isVerified,
  });

  factory LoginResponseDataModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseDataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        address: json['address'],
        type: json['type'],
        avatar: json['avatar'],
        phone: json['phone_number'],
        isVerified: json['is_verified'],
      );
}
