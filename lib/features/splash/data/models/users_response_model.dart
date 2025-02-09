class UsersResponseModel {
  int totalUsers;
  List<UserResponseData> userResponseData;

  UsersResponseModel({
    required this.totalUsers,
    required this.userResponseData,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) =>
      UsersResponseModel(
          totalUsers: json['total'],
          userResponseData: List<UserResponseData>.from(json['all_customers']
              .map((item) => UserResponseData.fromJson(item))));
}

class UserResponseData {
  int id;
  String nameAr;
  String nameEn;
  String phone;
  String email;
  String image;
  String taxNumber;
  String commercialHistory;

  UserResponseData({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.email,
    required this.image,
    required this.phone,
    required this.taxNumber,
    required this.commercialHistory,
  });

  factory UserResponseData.fromJson(Map<String, dynamic> json) =>
      UserResponseData(
        id: json['id'],
        nameAr: json['name'] ?? "",
        nameEn: json['name_en'] ?? "",
        email: json['email'] ?? "",
        image: json['image'] ?? "",
        phone: json['mobile'] ?? "",
        taxNumber: json['tax_number'] ?? "",
        commercialHistory: json['c_history'] ?? "",
      );
}
