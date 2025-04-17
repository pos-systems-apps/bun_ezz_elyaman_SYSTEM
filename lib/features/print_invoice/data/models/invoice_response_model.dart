class InvoiceResponseModel {
  bool success;
  Invoice invoice;

  InvoiceResponseModel({required this.success, required this.invoice});

  factory InvoiceResponseModel.fromJson(Map<String, dynamic> json) {
    return InvoiceResponseModel(
      success: json['success'],
      invoice: Invoice.fromJson(json['invoice']),
    );
  }
}

class Invoice {
  int id;
  int paymentType;
  double orderAmount;
  double totalTax;
  double collectedCash;

  double productsDiscount;
  double extraDiscount;
  String sellerImage;
  String qrCodeImage;
  String date;
  String type;
  Seller seller;
  Customer customer;
  List<InvoiceDetail> details;

  Invoice(
      {
        required this.id,
      required this.paymentType,
      required this.orderAmount,
      required this.totalTax,
      required this.collectedCash,
      required this.extraDiscount,
      required this.date,
      required this.type,
      required this.sellerImage,
      required this.qrCodeImage,
      required this.details,
      required this.seller,
      required this.customer,
      this.productsDiscount = 0}) {
    productsDiscount = ((details.fold(
        0,
        (sum, item) =>
            sum +
            (item.discountPerItem * item.quantity))));
  }

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      paymentType: json['cash'] ?? 0,
      orderAmount: json['order_amount'].toDouble(),
      totalTax: json['total_tax'].toDouble(),
      collectedCash:(json['collected_cash'] ?? 0).toDouble(),
      extraDiscount:(json['extra_discount'] ?? 0).toDouble(),
      date: json['date'] ?? "",
      type: json['type'] ?? "",
      sellerImage: json['qrcode'] ?? "",
      qrCodeImage: json['img'] ?? "",
      details: List<InvoiceDetail>.from(
          json['details'].map((item) => InvoiceDetail.fromJson(item))).toList(),
      seller: Seller.fromJson(json['seller']),
      customer: Customer.fromJson(json['customer']),
    );
  }
}

class InvoiceDetail {
  int id;
  int productID;
  String nameAr;
  String nameEn;
  double quantity;
  double discountPerItem;
  double extraDiscountPerItem;
  double taxPerItem;
  int unit;
  double unitValuePerItem;
  double price;

  InvoiceDetail({
    required this.id,
    required this.productID,
    required this.nameAr,
    required this.nameEn,
    required this.quantity,
    required this.discountPerItem,
    required this.extraDiscountPerItem,
    required this.taxPerItem,
    required this.unit,
    required this.unitValuePerItem,
    required this.price,
  });

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) {
    return InvoiceDetail(
      id: json['id'],
      productID: json['product']?['id'] ??0,
      nameAr: json['product']['name'] ?? "",
      nameEn: json['product']['name_en'] ?? "",
      quantity: (json['quantity'] ?? 0).toDouble(),
      discountPerItem: (json['discount_on_product'] ?? 0).toDouble(),
      extraDiscountPerItem: (json['extra_discount_on_product'] ?? 0).toDouble(),
      taxPerItem: (json['tax_amount'] ?? 0).toDouble(),
      unit: json['unit'] ?? 0,
      unitValuePerItem: (json['product']['unit_value'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toDouble(),
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
  String name;
  String phone;
  String email;
  String image;
  String comercialHistory;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.comercialHistory,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'] ?? "",
      phone: json['mobile'] ?? "",
      email: json['email'] ?? "",
      image: json['image'] ?? "",
      comercialHistory: json['c_history'] ?? "",
    );
  }
}
