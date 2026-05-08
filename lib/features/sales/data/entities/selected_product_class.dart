import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class ReseatSelectedProducts {
  List<SelectedProductClass> selectedProducts;
  double totalReseat;
  double totalDiscount;
  double extraDiscount;
  double valueTax;
  double total;

  ReseatSelectedProducts({
    required this.selectedProducts,
    this.totalReseat = 0,
    this.totalDiscount = 0,
    this.extraDiscount = 0,
    this.valueTax = 0,
    this.total = 0,
  });

  Map<String, double> getReseatData({
    int? discountTypeId,
    String? discount,
  }) {
    _resetTotals();

    for (final element in selectedProducts) {
      totalReseat += getProductTotalPriceInReseat(element);
      totalDiscount += getProductDiscountPriceInReseat(element);
    }

    final double totalAfterProductDiscount = totalReseat - totalDiscount;

    for (final element in selectedProducts) {
      final productExtraDiscount = getProductExtraDiscountPriceInReseat(
        element,
        discountTypeId,
        discount,
        totalPrice: totalAfterProductDiscount,
      );

      element.discountMoney = productExtraDiscount;
      extraDiscount += productExtraDiscount;

      valueTax += getProductTaxesPriceInReseat(
        element,
        discountTypeId,
        discount,
        totalPrice: totalAfterProductDiscount,
      );

      total += getTotalReseat(
        element,
        discountTypeId,
        discount,
        totalPrice: totalAfterProductDiscount,
      );
    }

    return {
      "totalReseat": totalReseat,
      "totalDiscount": totalDiscount,
      "extraDiscount": extraDiscount,
      "valueTax": valueTax,
      "total": total,
    };
  }

  void _resetTotals() {
    totalReseat = 0;
    totalDiscount = 0;
    extraDiscount = 0;
    valueTax = 0;
    total = 0;
  }

  double getProductTotalPriceInReseat(SelectedProductClass element) {
    final price = _toDouble(element.product.sellingPrice);
    return element.quantity * price;
  }

  double getProductDiscountPriceInReseat(SelectedProductClass element) {
    final discount = _toDouble(element.product.discountAmount);
    return element.quantity * discount;
  }

  double getProductExtraDiscountPriceInReseat(
      SelectedProductClass element,
      int? discountTypeId,
      String? discount, {
        double totalPrice = 0,
      }) {
    final productTotal = getProductTotalPriceInReseat(element);
    final productDiscount = getProductDiscountPriceInReseat(element);
    final productAfterDiscount = productTotal - productDiscount;

    return _calculateExtraDiscount(
      amount: productAfterDiscount,
      discountTypeId: discountTypeId,
      discount: discount,
      totalPrice: totalPrice,
    );
  }

  double getProductTaxesPriceInReseat(
      SelectedProductClass element,
      int? discountTypeId,
      String? discount, {
        double totalPrice = 0,
      }) {
    final productTotal = getProductTotalPriceInReseat(element);
    final productDiscount = getProductDiscountPriceInReseat(element);

    final amountAfterProductDiscount = productTotal - productDiscount;

    final productExtraDiscount = _calculateExtraDiscount(
      amount: amountAfterProductDiscount,
      discountTypeId: discountTypeId,
      discount: discount,
      totalPrice: totalPrice,
    );

    final amountBeforeTax = amountAfterProductDiscount - productExtraDiscount;

    if (amountBeforeTax <= 0) return 0;

    final taxRate = _toDouble(element.product.tax?.rate);

    return amountBeforeTax * (taxRate / 100);
  }

  double getTotalReseat(
      SelectedProductClass element,
      int? discountTypeId,
      String? discount, {
        double totalPrice = 0,
      }) {
    final productTotal = getProductTotalPriceInReseat(element);
    final productDiscount = getProductDiscountPriceInReseat(element);

    final productExtraDiscount = getProductExtraDiscountPriceInReseat(
      element,
      discountTypeId,
      discount,
      totalPrice: totalPrice,
    );

    final productTax = getProductTaxesPriceInReseat(
      element,
      discountTypeId,
      discount,
      totalPrice: totalPrice,
    );

    return productTotal - productDiscount - productExtraDiscount + productTax;
  }

  double _calculateExtraDiscount({
    required double amount,
    required int? discountTypeId,
    required String? discount,
    required double totalPrice,
  }) {
    if (amount <= 0) return 0;

    if (discountTypeId == null || discount == null || discount.trim().isEmpty) {
      return 0;
    }

    final discountValue = double.tryParse(discount) ?? 0;

    if (discountValue <= 0) return 0;

    /// discountTypeId == 1 => خصم ثابت على الفاتورة كلها
    if (discountTypeId == 1) {
      if (totalPrice <= 0) return 0;

      final safeDiscountValue =
      discountValue > totalPrice ? totalPrice : discountValue;

      return amount * (safeDiscountValue / totalPrice);
    }

    /// غير كده => خصم نسبة مئوية
    final safePercentage = discountValue > 100 ? 100 : discountValue;

    return amount * (safePercentage / 100);
  }

  double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}

class SelectedProductClass {
  TripProductModel product;

  /// الكمية المطلوبة من المنتج
  double quantity;

  /// نصيب المنتج من الخصم الإضافي على الفاتورة
  double discountMoney;

  SelectedProductClass({
    required this.product,
    this.quantity = 0,
    this.discountMoney = 0,
  });

  SelectedProductClass copyWith({
    TripProductModel? product,
    double? quantity,
    double? discountMoney,
  }) {
    return SelectedProductClass(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      discountMoney: discountMoney ?? this.discountMoney,
    );
  }
}