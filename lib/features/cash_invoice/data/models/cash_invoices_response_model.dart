class CashInvoicesResponseModel {
  final bool status;
  final String message;
  final List<CashInvoiceModel> data;
  final int code;

  CashInvoicesResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory CashInvoicesResponseModel.fromJson(Map<String, dynamic> json) {
    return CashInvoicesResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] == null
          ? []
          : List<CashInvoiceModel>.from(
        json['data'].map((x) => CashInvoiceModel.fromJson(x)),
      ),
      code: json['code'] ?? 0,
    );
  }
}

class CashInvoiceModel {
  final int id;
  final String collectionNumber;
  final String status;
  final String statusLabel;
  final DateTime? collectionDate;
  final double totalAmount;
  final String? notes;
  final int? tripId;
  final CashCustomerModel? customer;
  final List<CashInvoiceItemModel> items;

  CashInvoiceModel({
    required this.id,
    required this.collectionNumber,
    required this.status,
    required this.statusLabel,
    required this.collectionDate,
    required this.totalAmount,
    required this.notes,
    required this.tripId,
    required this.customer,
    required this.items,
  });

  factory CashInvoiceModel.fromJson(Map<String, dynamic> json) {
    return CashInvoiceModel(
      id: json['id'] ?? 0,
      collectionNumber: json['collection_number'] ?? '',
      status: json['status'] ?? '',
      statusLabel: json['status_label'] ?? '',
      collectionDate: json['collection_date'] != null
          ? DateTime.tryParse(json['collection_date'])
          : null,
      totalAmount: _toDouble(json['total_amount']),
      notes: json['notes'],
      tripId: json['trip_id'],
      customer: json['customer'] != null
          ? CashCustomerModel.fromJson(json['customer'])
          : null,
      items: json['items'] == null
          ? []
          : List<CashInvoiceItemModel>.from(
        json['items'].map((x) => CashInvoiceItemModel.fromJson(x)),
      ),
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}

class CashCustomerModel {
  final int id;
  final String name;
  final String? phone;

  CashCustomerModel({
    required this.id,
    required this.name,
    this.phone,
  });

  factory CashCustomerModel.fromJson(Map<String, dynamic> json) {
    return CashCustomerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'],
    );
  }
}

class CashInvoiceItemModel {
  final int id;
  final double amount;
  final String? notes;
  final CashSaleOrderModel? saleOrder;

  CashInvoiceItemModel({
    required this.id,
    required this.amount,
    required this.notes,
    required this.saleOrder,
  });

  factory CashInvoiceItemModel.fromJson(Map<String, dynamic> json) {
    return CashInvoiceItemModel(
      id: json['id'] ?? 0,
      amount: _toDouble(json['amount']),
      notes: json['notes'],
      saleOrder: json['sale_order'] != null
          ? CashSaleOrderModel.fromJson(json['sale_order'])
          : null,
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}

class CashSaleOrderModel {
  final int id;
  final String orderNumber;

  CashSaleOrderModel({
    required this.id,
    required this.orderNumber,
  });

  factory CashSaleOrderModel.fromJson(Map<String, dynamic> json) {
    return CashSaleOrderModel(
      id: json['id'] ?? 0,
      orderNumber: json['order_number'] ?? '',
    );
  }
}