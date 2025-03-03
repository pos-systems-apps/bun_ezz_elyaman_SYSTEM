class VisitListCarriedOutResponse {
  String status;
  List<VisitListCarriedOut> visitListCarriedOuts;

  VisitListCarriedOutResponse(
      {required this.status, required this.visitListCarriedOuts});

  factory VisitListCarriedOutResponse.fromJson(Map<String, dynamic> json) {
    return VisitListCarriedOutResponse(
      status: json['status'],
      visitListCarriedOuts: List<VisitListCarriedOut>.from(
          json["visitors"].map((x) => VisitListCarriedOut.fromJson(x))),
    );
  }
}

class VisitListCarriedOut {
  int id;
  String note;
  String lat;
  String lang;
  Customer customer;

  VisitListCarriedOut({
    required this.id,
    required this.note,
    required this.lat,
    required this.lang,
    required this.customer,
  });

  factory VisitListCarriedOut.fromJson(Map<String, dynamic> json) {
    return VisitListCarriedOut(
      id: json['id'],
      note: json['note'] ?? "",
      lat: json['lat'] ?? "0",
      lang: json['lang'] ?? "0",
      customer: Customer.fromJson(json['customer']),
    );
  }
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

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'] ?? "",
      nameEn: json['name_en'] ?? "",
      mobile: json['mobile'] ?? "",
      taxNumber: json['tax_number'] ?? "",
      commercialHistory: json['c_history'] ?? "",
    );
  }
}
