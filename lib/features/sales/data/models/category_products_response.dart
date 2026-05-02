class CategoryProductsResponse {
  final bool status;
  final String message;
  final List<TripProductModel> data;
  final int code;

  CategoryProductsResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) {
    return CategoryProductsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<TripProductModel>.from(
              json['data'].map((item) => TripProductModel.fromJson(item)),
            )
          : [],
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
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
  final num discountAmount;
  final num netPrice;
  final num taxAmount;
  final num finalPrice;
  final ProductUnitModel? unit;
  final ProductTaxModel? tax;
  final num availableQuantity;
  final List<AvailableUnitModel> availableUnits;

  TripProductModel({
    required this.id,
    required this.name,
    this.image,
    this.category,
    required this.sellingPrice,
    required this.discount,
    required this.discountType,
    required this.discountAmount,
    required this.netPrice,
    required this.taxAmount,
    required this.finalPrice,
    this.unit,
    this.tax,
    required this.availableQuantity,
    required this.availableUnits,
  });

  factory TripProductModel.fromJson(Map<String, dynamic> json) {
    return TripProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'],
      category: json['category'] != null
          ? ProductCategoryModel.fromJson(json['category'])
          : null,
      sellingPrice: double.tryParse(json['selling_price'].toString()) ?? 0,
      discount: double.tryParse(json['discount'].toString()) ?? 0,
      discountType: json['discount_type'] ?? '',
      discountAmount: num.tryParse(json['discount_amount'].toString()) ?? 0,
      netPrice: num.tryParse(json['net_price'].toString()) ?? 0,
      taxAmount: num.tryParse(json['tax_amount'].toString()) ?? 0,
      finalPrice: num.tryParse(json['final_price'].toString()) ?? 0,
      unit:
          json['unit'] != null ? ProductUnitModel.fromJson(json['unit']) : null,
      tax: json['tax'] != null ? ProductTaxModel.fromJson(json['tax']) : null,
      availableQuantity:
          num.tryParse(json['available_quantity'].toString()) ?? 0,
      availableUnits: json['available_units'] != null
          ? List<AvailableUnitModel>.from(
              json['available_units'].map(
                (item) => AvailableUnitModel.fromJson(item),
              ),
            )
          : [],
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
      'available_units': availableUnits.map((item) => item.toJson()).toList(),
    };
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
  final String? symbol;

  ProductUnitModel({
    required this.id,
    required this.name,
    this.symbol,
  });

  factory ProductUnitModel.fromJson(Map<String, dynamic> json) {
    return ProductUnitModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      symbol: json['symbol'],
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
  final num rate;
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
      rate: num.tryParse(json['rate'].toString()) ?? 0,
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
}

class AvailableUnitModel {
  final int id;
  final String name;
  final String symbol;
  final num price;
  final String discountType;
  final num discountRate;
  final num discountAmount;
  final num priceAfterDiscount;
  final String taxName;
  final num taxRate;
  final String taxType;
  final num taxAmount;
  final num priceWithTax;
  final num availableQuantity;
  final num remainderQuantity;
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
    this.remainderUnit,
  });

  factory AvailableUnitModel.fromJson(Map<String, dynamic> json) {
    return AvailableUnitModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      price: num.tryParse(json['price'].toString()) ?? 0,
      discountType: json['discount_type'] ?? '',
      discountRate: num.tryParse(json['discount_rate'].toString()) ?? 0,
      discountAmount: num.tryParse(json['discount_amount'].toString()) ?? 0,
      priceAfterDiscount:
          num.tryParse(json['price_after_discount'].toString()) ?? 0,
      taxName: json['tax_name'] ?? '',
      taxRate: num.tryParse(json['tax_rate'].toString()) ?? 0,
      taxType: json['tax_type'] ?? '',
      taxAmount: num.tryParse(json['tax_amount'].toString()) ?? 0,
      priceWithTax: num.tryParse(json['price_with_tax'].toString()) ?? 0,
      availableQuantity:
          num.tryParse(json['available_quantity'].toString()) ?? 0,
      remainderQuantity:
          num.tryParse(json['remainder_quantity'].toString()) ?? 0,
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
}
