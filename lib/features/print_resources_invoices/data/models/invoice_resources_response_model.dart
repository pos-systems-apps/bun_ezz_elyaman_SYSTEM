class InvoiceResourcesResponseModel {
  final bool status;
  final String message;
  final InvoiceResourceModel? data;
  final int code;

  InvoiceResourcesResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory InvoiceResourcesResponseModel.fromJson(Map<String, dynamic> json) {
    return InvoiceResourcesResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? InvoiceResourceModel.fromJson(json['data'])
          : null,
      code: json['code'] ?? 0,
    );
  }
}

class InvoiceResourceModel {
  final int id;
  final int tripId;
  final ResourceTripModel? trip;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? notes;
  final String status;
  final String statusLabel;
  final DateTime? createdAt;
  final List<InvoiceResourceItemModel> items;
  final dynamic convertedOrder;

  InvoiceResourceModel({
    required this.id,
    required this.tripId,
    required this.trip,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.notes,
    required this.status,
    required this.statusLabel,
    required this.createdAt,
    required this.items,
    required this.convertedOrder,
  });

  factory InvoiceResourceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceResourceModel(
      id: json['id'] ?? 0,
      tripId: json['trip_id'] ?? 0,
      trip: json['trip'] != null
          ? ResourceTripModel.fromJson(json['trip'])
          : null,
      customerName: json['customer_name'],
      customerPhone: json['customer_phone'],
      customerAddress: json['customer_address'],
      notes: json['notes'],
      status: json['status'] ?? '',
      statusLabel: json['status_label'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      items: json['items'] == null
          ? []
          : List<InvoiceResourceItemModel>.from(
        json['items'].map(
              (x) => InvoiceResourceItemModel.fromJson(x),
        ),
      ),
      convertedOrder: json['converted_order'],
    );
  }
}

class ResourceTripModel {
  final int id;
  final String tripNumber;
  final String status;

  ResourceTripModel({
    required this.id,
    required this.tripNumber,
    required this.status,
  });

  factory ResourceTripModel.fromJson(Map<String, dynamic> json) {
    return ResourceTripModel(
      id: json['id'] ?? 0,
      tripNumber: json['trip_number'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

class InvoiceResourceItemModel {
  final int id;
  final ResourceProductModel? product;
  final ResourceUnitModel? unit;
  final double quantity;
  final double unitPrice;
  final double subtotal;
  final String? notes;

  InvoiceResourceItemModel({
    required this.id,
    required this.product,
    required this.unit,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
    required this.notes,
  });

  factory InvoiceResourceItemModel.fromJson(Map<String, dynamic> json) {
    return InvoiceResourceItemModel(
      id: json['id'] ?? 0,
      product: json['product'] != null
          ? ResourceProductModel.fromJson(json['product'])
          : null,
      unit: json['unit'] != null
          ? ResourceUnitModel.fromJson(json['unit'])
          : null,
      quantity: _toDouble(json['quantity']),
      unitPrice: _toDouble(json['unit_price']),
      subtotal: _toDouble(json['subtotal']),
      notes: json['notes'],
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

class ResourceProductModel {
  final int id;
  final String name;

  ResourceProductModel({
    required this.id,
    required this.name,
  });

  factory ResourceProductModel.fromJson(Map<String, dynamic> json) {
    return ResourceProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class ResourceUnitModel {
  final int id;
  final String name;

  ResourceUnitModel({
    required this.id,
    required this.name,
  });

  factory ResourceUnitModel.fromJson(Map<String, dynamic> json) {
    return ResourceUnitModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}