// class UserSettingResponse {
//   int distanceInKilometers;
//   UserSettingResponseInfo userSettingResponseInfo;
//
//   UserSettingResponse(
//       {required this.distanceInKilometers,
//       required this.userSettingResponseInfo});
//
//   factory UserSettingResponse.fromJson(Map<String, dynamic> json) =>
//       UserSettingResponse(
//         distanceInKilometers: json['kilometer'] ?? 0,
//         userSettingResponseInfo:
//             UserSettingResponseInfo.fromJson(json['admin']),
//       );
// }
//
// class UserSettingResponseInfo {
//   int id;
//   String firstName;
//   String lastName;
//
//   String email;
//   String phone;
//   String image;
//
//   String mandobCode;
//   String vehicleCode;
//   String role;
//   String type;
//
//   int numberOfDays;
//   int dashboard;
//   int stock;
//   int store;
//   int admin;
//   int pos;
//   int sales;
//
//
//   UserSettingResponseInfo({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.type,
//     required this.image,
//     required this.phone,
//     required this.mandobCode,
//     required this.vehicleCode,
//     required this.role,
//     required this.numberOfDays,
//     required this.dashboard,
//     required this.stock,
//     required this.store,
//     required this.admin,
//     required this.pos,
//     required this.sales,
//   });
//
//   factory UserSettingResponseInfo.fromJson(Map<String, dynamic> json) =>
//       UserSettingResponseInfo(
//         id: json['id'],
//         firstName: json['f_name'] ?? "",
//         lastName: json['l_name'] ?? "",
//         email: json['email'] ?? "",
//         type: json['type'] ?? "",
//         image: json['image'] ?? "",
//         phone: json['phone'] ?? "",
//         mandobCode: json['mandob_code'] ?? "",
//         vehicleCode: json['vehicle_code'] ?? "",
//         role: json['role'] ?? "",
//         numberOfDays: json['number_of_days'] ?? 0,
//         dashboard: json['dashboard'] ?? 0,
//         stock: json['stock'] ?? 0,
//
//         store: json['store'] ?? 0,
//         admin: json['admin'] ?? 0,
//         pos: json['pos'] ?? 0,
//         sales: json['sales'] ?? 0,
//       );
// }
