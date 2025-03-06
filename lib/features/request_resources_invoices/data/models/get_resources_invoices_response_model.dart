class GetResourcesInvoicesResponseModel {
  List<ResourcesInvoices> reservations;

  GetResourcesInvoicesResponseModel({
    required this.reservations,
  });

  factory GetResourcesInvoicesResponseModel.fromJson(
      Map<String, dynamic> json) {
    return GetResourcesInvoicesResponseModel(
      reservations: List<ResourcesInvoices>.from((json['reservations'])
          .map((item) => ResourcesInvoices.fromJson(item))).toList(),
    );
  }
}

class ResourcesInvoices {
  int id;
  List<ResourcesInvoicesData> items;
  String date;
  SellerDate seller;

  ResourcesInvoices({
    required this.id,
    required this.items,
    required this.date,
    required this.seller,
  });

  factory ResourcesInvoices.fromJson(Map<String, dynamic> json) {
    return ResourcesInvoices(
      id: json['id'],
      items: List<ResourcesInvoicesData>.from(
              json['data'].map((item) => ResourcesInvoicesData.fromJson(item)))
          .toList(),
      date: json['date'] ?? "",
      seller: SellerDate.fromJson(json['seller']),
    );
  }
}

class ResourcesInvoicesData {
  int productId;
  String productName;

  double requestQuantity;
  double yourQuantity;
  double price;
  String productCode;

  ResourcesInvoicesData({
    required this.productId,
    required this.productName,
    required this.requestQuantity,
    required this.yourQuantity,
    required this.price,
    required this.productCode,
  });

  factory ResourcesInvoicesData.fromJson(Map<String, dynamic> json) {
    return ResourcesInvoicesData(
      productId: json['product_id'],
      productName: json['product_name'] ?? "",
      requestQuantity: (json['stock'] ?? 0).toDouble(),
      yourQuantity: (json['balance'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toDouble(),
      productCode: json['product_code'] ?? "",
    );
  }
}

class SellerDate {
  int id;
  String nameAr;

  SellerDate({
    required this.id,
    required this.nameAr,
  });

  factory SellerDate.fromJson(Map<String, dynamic> json) {
    return SellerDate(
      id: json['id'],
      nameAr: (json['f_name'] ?? "") + (json['l_name'] ?? ""),
    );
  }
}
