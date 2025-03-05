
class GetInvoicesResponseModel {
  List<Invoices> invoices;

  GetInvoicesResponseModel({
    required this.invoices,
  });

  factory GetInvoicesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetInvoicesResponseModel(
      invoices: List<Invoices>.from((json['refnd'] ?? json['orders'])
          .map((item) => Invoices.fromJson(item))).toList(),
    );
  }
}

class Invoices {
  int id;
  double orderAmount;
  double totalTax;
  double collectedCash;
  double extraDiscount;
  int cash;
  String createdAt;

  Invoices({
    required this.id,
    required this.orderAmount,
    required this.totalTax,
    required this.collectedCash,
    required this.extraDiscount,
    required this.cash,
    required this.createdAt,
  });

  factory Invoices.fromJson(Map<String, dynamic> json) {
    return Invoices(
      id: json['id'],
      orderAmount: (json['order_amount'] ?? 0).toDouble(),
      totalTax: (json['total_tax'] ?? 0).toDouble(),
      collectedCash: (json['collected_cash'] ?? 0).toDouble(),
      extraDiscount: (json['extra_discount'] ?? 0).toDouble(),
      cash: json['cash'],
      createdAt: json['created_at'],
    );
  }
}
