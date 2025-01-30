class LoginRequestModel {
  String? login;
  String? password;

  LoginRequestModel({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
      };
}
