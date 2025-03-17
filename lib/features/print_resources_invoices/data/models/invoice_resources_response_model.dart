class InvoiceResourcesResponseModel {
  List<ResourceInvoice> resourceInvoice;

  InvoiceResourcesResponseModel({
    required this.resourceInvoice,
  });

  factory InvoiceResourcesResponseModel.fromJson(Map<String, dynamic> json) {
    return InvoiceResourcesResponseModel(
      resourceInvoice: List<ResourceInvoice>.from(
          json['reservations'].map((item) => ResourceInvoice.fromJson(item))),
    );
  }
}

class ResourceInvoice {
  int id;
  String date;
  String type;
  Seller seller;
  List<ItemInvoice> items;

  ResourceInvoice({
    required this.id,
    required this.date,
    required this.type,
    required this.items,
    required this.seller,
  });

  factory ResourceInvoice.fromJson(Map<String, dynamic> json) {
    return ResourceInvoice(
      id: json['id'],
      date: json['created_at'].toString(),
      type: json['type'].toString(),
      items: List<ItemInvoice>.from(
          json['data'].map((item) => ItemInvoice.fromJson(item))).toList(),
      seller: Seller.fromJson(json['seller']),
    );
  }
}

class ItemInvoice {
  String name;
  String productCode;
  double requestQuantity;
  double yourQuantity;
  double price;

  ItemInvoice({
    required this.name,
    required this.productCode,
    required this.requestQuantity,
    required this.yourQuantity,
    required this.price,
  });

  factory ItemInvoice.fromJson(Map<String, dynamic> json) {
    return ItemInvoice(
      name: json['product_name'] ?? "",
      productCode: json['product_code'] ?? "",
      requestQuantity: double.tryParse(json['stock'].toString()) ?? 0,
      yourQuantity: double.tryParse(json['balance'].toString()) ?? 0,
      price: double.tryParse(json['price'].toString()) ?? 0,
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
