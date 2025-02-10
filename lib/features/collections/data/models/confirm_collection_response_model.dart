class ConfirmCollectionResponseModel {
  int kilometer;
  String message;
  String token;
  LoginResponseDataModel data;

  ConfirmCollectionResponseModel({
    required this.kilometer,
    required this.message,
    required this.token,
    required this.data,
  });

  factory ConfirmCollectionResponseModel.fromJson(Map<String, dynamic> json) =>
      ConfirmCollectionResponseModel(
          kilometer: json['kilometer'],
          message: json['message'],
          token: json['token'],
          data: LoginResponseDataModel.fromJson(json['admin']));
}

class LoginResponseDataModel {
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

  LoginResponseDataModel({
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

  factory LoginResponseDataModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseDataModel(
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
