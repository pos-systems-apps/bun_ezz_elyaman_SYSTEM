class CashInvoicesResponseModel {
  List<CashInvoice> invoices;

  CashInvoicesResponseModel({
    required this.invoices,
  });

  factory CashInvoicesResponseModel.fromJson(
      Map<String, dynamic> json) {
    return CashInvoicesResponseModel(
      invoices: List<CashInvoice>.from((json['installments'])
          .map((item) => CashInvoice.fromJson(item))).toList(),
    );
  }
}

class CashInvoice {
  int id;
  String sellerName;
  String customerName;
  double price;
  String createdAt;

  CashInvoice({
    required this.id,
    required this.sellerName,
    required this.customerName,
    required this.price,
    required this.createdAt,
  });

  factory CashInvoice.fromJson(Map<String, dynamic> json) {
    return CashInvoice(
      id: json['id'],
      sellerName: json['seller']['name'] ?? "",
      customerName: json['customer']['name'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      createdAt: json['date'],
    );
  }
}
