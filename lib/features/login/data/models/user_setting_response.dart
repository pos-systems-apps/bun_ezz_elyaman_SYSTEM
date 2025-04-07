class UserSettingResponse {
  int distanceInKilometers;
  UserSettingResponseInfo userSettingResponseInfo;

  UserSettingResponse(
      {required this.distanceInKilometers,
      required this.userSettingResponseInfo});

  factory UserSettingResponse.fromJson(Map<String, dynamic> json) =>
      UserSettingResponse(
        distanceInKilometers: json['kilometer'] ?? 0,
        userSettingResponseInfo:
            UserSettingResponseInfo.fromJson(json['admin']),
      );
}

class UserSettingResponseInfo {
  int id;
  String firstName;
  String lastName;

  String email;
  String phone;
  String image;

  String mandobCode;
  String vehicleCode;
  String type;
  String role;
  int numberOfDays;

  UserSettingResponseInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.type,
    required this.image,
    required this.phone,
    required this.mandobCode,
    required this.vehicleCode,
    required this.role,
    required this.numberOfDays,
  });

  factory UserSettingResponseInfo.fromJson(Map<String, dynamic> json) =>
      UserSettingResponseInfo(
        id: json['id'],
        firstName: json['f_name'] ?? "",
        lastName: json['l_name'] ?? "",
        email: json['email'] ?? "",
        type: json['type'] ?? "",
        image: json['image'] ?? "",
        phone: json['phone'] ?? "",
        mandobCode: json['mandob_code'] ?? "",
        vehicleCode: json['vehicle_code'] ?? "",
        role: json['role'] ?? "",
        numberOfDays: json['number_of_days'] ?? 0,
      );
}
