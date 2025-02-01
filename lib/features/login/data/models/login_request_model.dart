class LoginRequestModel {
  String code;
  String password;

  LoginRequestModel({
    required this.code,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "code": code,
        "password": password,
      };
}
