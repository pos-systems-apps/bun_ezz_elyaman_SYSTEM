class RequiredVisitListResponse {
  String status;
  List<RequiredVisitor> requiredVisitors;

  RequiredVisitListResponse(
      {required this.status, required this.requiredVisitors});

  factory RequiredVisitListResponse.fromJson(Map<String, dynamic> json) =>
      RequiredVisitListResponse(
        status: json["status"],
        requiredVisitors: List<RequiredVisitor>.from(
            json["visitors"].map((x) => RequiredVisitor.fromJson(x))),
      );
}

class RequiredVisitor {
  int id;
  String note;
  String date;
  Seller seller;
  Customer customer;

  RequiredVisitor({
    required this.id,
    required this.note,
    required this.date,
    required this.seller,
    required this.customer,
  });

  factory RequiredVisitor.fromJson(Map<String, dynamic> json) =>
      RequiredVisitor(
        id: json["id"],
        note: json["note"] ?? "",
        date: json["date"] ?? "",
        seller: Seller.fromJson(json["seller"]),
        customer: Customer.fromJson(json["customer"]),
      );
}

class Seller {
  int id;
  String nameAr;
  String nameEn;

  Seller({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        nameAr: (json["f_name"] ?? "") + (json["l_name"] ?? ""),
        nameEn: json["name_en"],
      );
}

class Customer {
  int id;
  String name;
  String nameEn;
  String mobile;
  String taxNumber;
  String commercialHistory;

  Customer({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.mobile,
    required this.taxNumber,
    required this.commercialHistory,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"] ?? "",
        nameEn: json["name_en"] ?? "",
        mobile: json["mobile"] ?? "",
        taxNumber: json["tax_number"] ?? "",
        commercialHistory: json["c_history"] ?? "",
      );
}
