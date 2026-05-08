class TripProductsResponse {
  final bool status;
  final String message;
  final List<TripProductModel> data;
  final int code;

  TripProductsResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory TripProductsResponse.fromJson(Map<String, dynamic> json) {
    return TripProductsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] == null
          ? []
          : List<TripProductModel>.from(
        json['data'].map((x) => TripProductModel.fromJson(x)),
      ),
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((x) => x.toJson()).toList(),
      'code': code,
    };
  }
}

class TripProductModel {
  final int id;
  final String name;
  final String? image;
  final ProductCategoryModel? category;
  final double sellingPrice;
  final double discount;
  final String discountType;
  final double discountAmount;
  final double netPrice;
  final double taxAmount;
  final double finalPrice;
  final ProductUnitModel? unit;
  final ProductTaxModel? tax;
  final double availableQuantity;

  TripProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.sellingPrice,
    required this.discount,
    required this.discountType,
    required this.discountAmount,
    required this.netPrice,
    required this.taxAmount,
    required this.finalPrice,
    required this.unit,
    required this.tax,
    required this.availableQuantity,
   });

  factory TripProductModel.fromJson(Map<String, dynamic> json) {
    return TripProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'],
      category: json['category'] != null
          ? ProductCategoryModel.fromJson(json['category'])
          : null,
      sellingPrice: _toDouble(json['selling_price']),
      discount: _toDouble(json['discount']),
      discountType: json['discount_type'] ?? '',
      discountAmount: _toDouble(json['discount_amount']),
      netPrice: _toDouble(json['net_price']),
      taxAmount: _toDouble(json['tax_amount']),
      finalPrice: _toDouble(json['final_price']),
      unit: json['unit'] != null
          ? ProductUnitModel.fromJson(json['unit'])
          : null,
      tax: json['tax'] != null
          ? ProductTaxModel.fromJson(json['tax'])
          : null,
      availableQuantity: _toDouble(json['available_quantity']),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'category': category?.toJson(),
      'selling_price': sellingPrice,
      'discount': discount,
      'discount_type': discountType,
      'discount_amount': discountAmount,
      'net_price': netPrice,
      'tax_amount': taxAmount,
      'final_price': finalPrice,
      'unit': unit?.toJson(),
      'tax': tax?.toJson(),
      'available_quantity': availableQuantity,
     };
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}

class ProductCategoryModel {
  final int id;
  final String name;

  ProductCategoryModel({
    required this.id,
    required this.name,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class ProductUnitModel {
  final int id;
  final String name;
  final String symbol;

  ProductUnitModel({
    required this.id,
    required this.name,
    required this.symbol,
  });

  factory ProductUnitModel.fromJson(Map<String, dynamic> json) {
    return ProductUnitModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
    };
  }
}

class ProductTaxModel {
  final int id;
  final String name;
  final double rate;
  final String type;

  ProductTaxModel({
    required this.id,
    required this.name,
    required this.rate,
    required this.type,
  });

  factory ProductTaxModel.fromJson(Map<String, dynamic> json) {
    return ProductTaxModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      rate: _toDouble(json['rate']),
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rate': rate,
      'type': type,
    };
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}

class AvailableUnitModel {
  final int id;
  final String name;
  final String symbol;
  final double price;
  final String discountType;
  final double discountRate;
  final double discountAmount;
  final double priceAfterDiscount;
  final String taxName;
  final double taxRate;
  final String taxType;
  final double taxAmount;
  final double priceWithTax;
  final double availableQuantity;
  final double remainderQuantity;
  final ProductUnitModel? remainderUnit;

  AvailableUnitModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.discountType,
    required this.discountRate,
    required this.discountAmount,
    required this.priceAfterDiscount,
    required this.taxName,
    required this.taxRate,
    required this.taxType,
    required this.taxAmount,
    required this.priceWithTax,
    required this.availableQuantity,
    required this.remainderQuantity,
    required this.remainderUnit,
  });

  factory AvailableUnitModel.fromJson(Map<String, dynamic> json) {
    return AvailableUnitModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      price: _toDouble(json['price']),
      discountType: json['discount_type'] ?? '',
      discountRate: _toDouble(json['discount_rate']),
      discountAmount: _toDouble(json['discount_amount']),
      priceAfterDiscount: _toDouble(json['price_after_discount']),
      taxName: json['tax_name'] ?? '',
      taxRate: _toDouble(json['tax_rate']),
      taxType: json['tax_type'] ?? '',
      taxAmount: _toDouble(json['tax_amount']),
      priceWithTax: _toDouble(json['price_with_tax']),
      availableQuantity: _toDouble(json['available_quantity']),
      remainderQuantity: _toDouble(json['remainder_quantity']),
      remainderUnit: json['remainder_unit'] != null
          ? ProductUnitModel.fromJson(json['remainder_unit'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'price': price,
      'discount_type': discountType,
      'discount_rate': discountRate,
      'discount_amount': discountAmount,
      'price_after_discount': priceAfterDiscount,
      'tax_name': taxName,
      'tax_rate': taxRate,
      'tax_type': taxType,
      'tax_amount': taxAmount,
      'price_with_tax': priceWithTax,
      'available_quantity': availableQuantity,
      'remainder_quantity': remainderQuantity,
      'remainder_unit': remainderUnit?.toJson(),
    };
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}