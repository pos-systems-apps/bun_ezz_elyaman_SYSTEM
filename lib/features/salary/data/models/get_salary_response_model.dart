class GetSalaryResponseModel {
  List<Salary> salaries;
  String month;

  GetSalaryResponseModel({required this.salaries, required this.month});

  factory GetSalaryResponseModel.fromJson(Map<String, dynamic> json) {
    return GetSalaryResponseModel(
      salaries: List<Salary>.from(
          json['salaries'].map((x) => Salary.fromJson(x)) ?? []),
      month: json['month'] ?? '',
    );
  }
}

class Salary {
  int id;
  String salary;
  String commission;
  String numberOfVisitors;
  String resultOfVisitors;
  String salaryOfVisitors;
  String transportAmount;
  String score;
  String month;
  String note;
  String noteManager;
  int numberOfDays;
  String discount;
  String total;
  String other;
  Seller seller;

  Salary({
    required this.id,
    required this.salary,
    required this.commission,
    required this.numberOfVisitors,
    required this.resultOfVisitors,
    required this.salaryOfVisitors,
    required this.transportAmount,
    required this.score,
    required this.month,
    required this.note,
    required this.noteManager,
    required this.numberOfDays,
    required this.discount,
    required this.total,
    required this.other,
    required this.seller,
  });

  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
      id: json['id'],
      salary: json['salary'] ?? "0",
      commission: json['commission'] ?? "0",
      numberOfVisitors: json['number_of_visitors'] ?? "0",
      resultOfVisitors: json['result_of_visitors'] ?? "0",
      salaryOfVisitors: json['salary_of_visitors'] ?? "0",
      transportAmount: json['transport_amount'] ?? "",
      score: json['score'] ?? "0",
      month: json['month'] ?? "",
      note: json['note'] ?? "",
      noteManager: json['notemanager'] ?? "",
      numberOfDays: json['number_of_days'] ?? 0,
      discount: json['discount'] ?? "",
      total: json['total'] ?? "0",
      other: json['other'] ?? "",
      seller: Seller.fromJson(json['seller']),
    );
  }
}

class Seller {
  int id;
  String name;
  String nameEn;
  String email;
  String phone;

  int holidays;

  Seller({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.email,
    required this.phone,
    required this.holidays,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      name: (json['f_name'] ?? "") + (json['l_name'] ?? ""),
      nameEn: json['name_en'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      holidays: json['holidays'] ?? 0,
    );
  }
}
