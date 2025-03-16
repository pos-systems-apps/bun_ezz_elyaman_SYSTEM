class InvoiceCashResponseModel {
  bool success;
  CashInvoice cashInvoice;

  InvoiceCashResponseModel({required this.success, required this.cashInvoice});

  factory InvoiceCashResponseModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCashResponseModel(
      success: json['success'],
      cashInvoice: CashInvoice.fromJson(json['invoice']),
    );
  }
}

class CashInvoice {
  int id;
  double price;
  String description;
  String date;
  String image;
  Seller seller;
  Customer customer;

  CashInvoice({
    required this.id,
    required this.price,
    required this.description,
    required this.date,
    required this.image,
    required this.seller,
    required this.customer,
  });

  factory CashInvoice.fromJson(Map<String, dynamic> json) {
    return CashInvoice(
      id: json['id'],
      price: (json['total_price'].toDouble()) ?? 0,
      description: json['note'] ?? "",
      date: json['created_at'],
      image: json['img'] ?? "",
      seller: Seller.fromJson(json['seller']),
      customer: Customer.fromJson(json['customer']),
    );
  }
}

class Seller {
  int id;
  String name;
  String email;
  String phone;
  String mandoubeCode;
  String vehicleCode;
  String type;
  String role;

  Seller({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.mandoubeCode,
    required this.vehicleCode,
    required this.type,
    required this.role,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      name: (json['f_name'] ?? "") + (json['l_name'] ?? ""),
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      mandoubeCode: json['mandob_code'] ?? "",
      vehicleCode: json['vehicle_code'] ?? "",
      type: json['type'] ?? "",
      role: json['role'] ?? "",
    );
  }
}

class Customer {
  int id;
  String nameAr;
  String nameEn;
  String phone;
  String email;
  double balance;
  String image;
  String taxNumber;
  String comercialHistory;

  Customer({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.phone,
    required this.balance,
    required this.email,
    required this.image,
    required this.taxNumber,
    required this.comercialHistory,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      nameAr: json['name'] ?? "",
      nameEn: json['name_en'] ?? "",
      phone: json['mobile'] ?? "",
      balance: (json['balance'].toDouble()) ?? 0,
      email: json['email'] ?? "",
      image: json['image'] ?? "",
      taxNumber: json['tax_number'] ?? "",
      comercialHistory: json['c_history'] ?? "",
    );
  }
}
