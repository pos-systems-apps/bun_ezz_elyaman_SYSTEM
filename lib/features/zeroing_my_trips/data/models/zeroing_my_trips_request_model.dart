class ZeroingMyTripsRequestModel {
  String email;
  String password;

  ZeroingMyTripsRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
