class GetInvoicesResponseModel {
  final bool status;
  final String message;
  final List<InvoiceModel> data;
  final int code;

  GetInvoicesResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory GetInvoicesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetInvoicesResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] == null
          ? []
          : List<InvoiceModel>.from(
        json['data'].map((x) => InvoiceModel.fromJson(x)),
      ),
      code: json['code'] ?? 0,
    );
  }
}

class InvoiceModel {
  final int id;

  /// Sale invoice
  final String? orderNumber;

  /// Return invoice
  final String? returnNumber;

  final String status;
  final String statusLabel;
  final DateTime? date;

  /// Sale fields
  final String? paymentMethod;
  final String? paymentMethodLabel;
  final DateTime? dueDate;
  final double discountAmount;
  final String? discountType;
  final double taxAmount;
  final double total;
  final double paidAmount;
  final double remainingAmount;

  /// Return fields
  final double refundAmount;

  final double subtotal;
  final InvoiceCustomerModel? customer;
  final String? notes;
  final int? tripId;

  /// موجودة في المرتجعات، وممكن تكون null أو [] في البيع
  final List<InvoiceItemModel>? items;

  InvoiceModel({
    required this.id,
    required this.orderNumber,
    required this.returnNumber,
    required this.status,
    required this.statusLabel,
    required this.date,
    required this.paymentMethod,
    required this.paymentMethodLabel,
    required this.dueDate,
    required this.subtotal,
    required this.discountAmount,
    required this.discountType,
    required this.taxAmount,
    required this.total,
    required this.paidAmount,
    required this.remainingAmount,
    required this.refundAmount,
    required this.customer,
    required this.notes,
    required this.tripId,
    required this.items,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      id: json['id'] ?? 0,
      orderNumber: json['order_number'],
      returnNumber: json['return_number'],
      status: json['status'] ?? '',
      statusLabel: json['status_label'] ?? '',
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      paymentMethod: json['payment_method'],
      paymentMethodLabel: json['payment_method_label'],
      dueDate: json['due_date'] != null
          ? DateTime.tryParse(json['due_date'])
          : null,
      subtotal: _toDouble(json['subtotal']),
      discountAmount: _toDouble(json['discount_amount']),
      discountType: json['discount_type'],
      taxAmount: _toDouble(json['tax_amount']),
      total: _toDouble(json['total']),
      paidAmount: _toDouble(json['paid_amount']),
      remainingAmount: _toDouble(json['remaining_amount']),
      refundAmount: _toDouble(json['refund_amount']),
      customer: json['customer'] != null
          ? InvoiceCustomerModel.fromJson(json['customer'])
          : null,
      notes: json['notes'],
      tripId: json['trip_id'],
      items: json['items'] == null
          ? null
          : List<InvoiceItemModel>.from(
        json['items'].map((x) => InvoiceItemModel.fromJson(x)),
      ),
    );
  }

  bool get isSaleInvoice => orderNumber != null;

  bool get isReturnInvoice => returnNumber != null;

  String get invoiceNumber {
    return orderNumber ?? returnNumber ?? id.toString();
  }

  double get invoiceAmount {
    return isReturnInvoice ? refundAmount : total;
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

class InvoiceCustomerModel {
  final int id;
  final String name;
  final String? phone;

  InvoiceCustomerModel({
    required this.id,
    required this.name,
    this.phone,
  });

  factory InvoiceCustomerModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCustomerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'],
    );
  }
}

class InvoiceItemModel {
  final int id;
  final InvoiceProductModel? product;
  final InvoiceUnitModel? unit;
  final double quantity;
  final double unitPrice;

  /// Sale item fields
  final double discount;
  final String? discountType;
  final double taxAmount;
  final double total;

  /// Return item fields
  final double refundAmount;
  final String? reason;

  InvoiceItemModel({
    required this.id,
    required this.product,
    required this.unit,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
    required this.discountType,
    required this.taxAmount,
    required this.total,
    required this.refundAmount,
    required this.reason,
  });

  factory InvoiceItemModel.fromJson(Map<String, dynamic> json) {
    return InvoiceItemModel(
      id: json['id'] ?? 0,
      product: json['product'] != null
          ? InvoiceProductModel.fromJson(json['product'])
          : null,
      unit: json['unit'] != null
          ? InvoiceUnitModel.fromJson(json['unit'])
          : null,
      quantity: _toDouble(json['quantity']),
      unitPrice: _toDouble(json['unit_price']),
      discount: _toDouble(json['discount']),
      discountType: json['discount_type'],
      taxAmount: _toDouble(json['tax_amount']),
      total: _toDouble(json['total']),
      refundAmount: _toDouble(json['refund_amount']),
      reason: json['reason'],
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

class InvoiceProductModel {
  final int id;
  final String name;

  InvoiceProductModel({
    required this.id,
    required this.name,
  });

  factory InvoiceProductModel.fromJson(Map<String, dynamic> json) {
    return InvoiceProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class InvoiceUnitModel {
  final int id;
  final String name;

  InvoiceUnitModel({
    required this.id,
    required this.name,
  });

  factory InvoiceUnitModel.fromJson(Map<String, dynamic> json) {
    return InvoiceUnitModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}