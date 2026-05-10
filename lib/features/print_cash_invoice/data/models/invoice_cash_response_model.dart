class InvoiceCashResponseModel {
  final bool status;
  final String message;
  final InvoiceCashModel? data;
  final int code;

  InvoiceCashResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory InvoiceCashResponseModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCashResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? InvoiceCashModel.fromJson(json['data']) : null,
      code: json['code'] ?? 0,
    );
  }
}

class InvoiceCashModel {
  final int id;
  final String collectionNumber;
  final String status;
  final String statusLabel;
  final DateTime? collectionDate;
  final double totalAmount;
  final String? notes;
  final int? tripId;
  final InvoiceCashCustomerModel? customer;
  final List<InvoiceCashItemModel> items;

  InvoiceCashModel({
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

  factory InvoiceCashModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCashModel(
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
          ? InvoiceCashCustomerModel.fromJson(json['customer'])
          : null,
      items: json['items'] == null
          ? []
          : List<InvoiceCashItemModel>.from(
        json['items'].map((x) => InvoiceCashItemModel.fromJson(x)),
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

class InvoiceCashCustomerModel {
  final int id;
  final String name;
  final String? phone;

  InvoiceCashCustomerModel({
    required this.id,
    required this.name,
    this.phone,
  });

  factory InvoiceCashCustomerModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCashCustomerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'],
    );
  }
}

class InvoiceCashItemModel {
  final int id;
  final double amount;
  final String? notes;
  final InvoiceCashSaleOrderModel? saleOrder;

  InvoiceCashItemModel({
    required this.id,
    required this.amount,
    required this.notes,
    required this.saleOrder,
  });

  factory InvoiceCashItemModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCashItemModel(
      id: json['id'] ?? 0,
      amount: _toDouble(json['amount']),
      notes: json['notes'],
      saleOrder: json['sale_order'] != null
          ? InvoiceCashSaleOrderModel.fromJson(json['sale_order'])
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

class InvoiceCashSaleOrderModel {
  final int id;
  final String orderNumber;

  InvoiceCashSaleOrderModel({
    required this.id,
    required this.orderNumber,
  });

  factory InvoiceCashSaleOrderModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCashSaleOrderModel(
      id: json['id'] ?? 0,
      orderNumber: json['order_number'] ?? '',
    );
  }
}