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
    totalReseat = 0;
    totalDiscount = 0;
    extraDiscount = 0;
    valueTax = 0;
    total = 0;

    for (var element in selectedProducts) {
      totalReseat += getProductTotalPriceInReseat(element);
      totalDiscount += getProductDiscountPriceInReseat(element);
    }

    final double totalAfterProductDiscount = totalReseat - totalDiscount;

    for (var element in selectedProducts) {
      extraDiscount += getProductExtraDiscountPriceInReseat(
        element,
        discountTypeId,
        discount,
        totalPrice: totalAfterProductDiscount,
      );

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

  double getProductTotalPriceInReseat(SelectedProductClass element) {
    double result = 0;

    final mainUnit = _getMainUnit(element);
    final minUnit = _getMinUnit(element, mainUnit);

    if (element.maxValueCounter > 0) {
      result += element.maxValueCounter * _getUnitPrice(element, mainUnit);
    }

    if (element.minValueCounter > 0) {
      result += element.minValueCounter * _getUnitPrice(element, minUnit);
    }

    return result;
  }

  double getProductDiscountPriceInReseat(SelectedProductClass element) {
    double result = 0;

    final mainUnit = _getMainUnit(element);
    final minUnit = _getMinUnit(element, mainUnit);

    if (element.maxValueCounter > 0) {
      result += element.maxValueCounter * _getUnitDiscount(element, mainUnit);
    }

    if (element.minValueCounter > 0) {
      result += element.minValueCounter * _getUnitDiscount(element, minUnit);
    }

    return result;
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
    double tax = 0;

    final mainUnit = _getMainUnit(element);
    final minUnit = _getMinUnit(element, mainUnit);

    if (element.maxValueCounter > 0) {
      tax += _calculateTaxForUnit(
        element: element,
        unit: mainUnit,
        quantity: element.maxValueCounter,
        discountTypeId: discountTypeId,
        discount: discount,
        totalPrice: totalPrice,
      );
    }

    if (element.minValueCounter > 0) {
      tax += _calculateTaxForUnit(
        element: element,
        unit: minUnit,
        quantity: element.minValueCounter,
        discountTypeId: discountTypeId,
        discount: discount,
        totalPrice: totalPrice,
      );
    }

    return tax;
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

  double _calculateTaxForUnit({
    required SelectedProductClass element,
    required AvailableUnitModel? unit,
    required int quantity,
    required int? discountTypeId,
    required String? discount,
    required double totalPrice,
  }) {
    final unitPrice = _getUnitPrice(element, unit);
    final unitDiscount = _getUnitDiscount(element, unit);
    final taxRate = _getUnitTaxRate(element, unit);

    final totalUnitPrice = unitPrice * quantity;
    final totalUnitDiscount = unitDiscount * quantity;

    final amountAfterProductDiscount = totalUnitPrice - totalUnitDiscount;

    final unitExtraDiscount = _calculateExtraDiscount(
      amount: amountAfterProductDiscount,
      discountTypeId: discountTypeId,
      discount: discount,
      totalPrice: totalPrice,
    );

    final amountBeforeTax = amountAfterProductDiscount - unitExtraDiscount;

    return amountBeforeTax * (taxRate / 100);
  }

  double _calculateExtraDiscount({
    required double amount,
    required int? discountTypeId,
    required String? discount,
    required double totalPrice,
  }) {
    if (discountTypeId == null || discount == null || discount.isEmpty) {
      return 0;
    }

    final discountValue = double.tryParse(discount) ?? 0;

    if (discountValue <= 0) {
      return 0;
    }

    /// discountTypeId == 1
    /// معناها خصم مبلغ ثابت على الفاتورة كلها
    /// فبنوزعه على المنتجات حسب نسبة كل منتج من إجمالي الفاتورة
    if (discountTypeId == 1) {
      if (totalPrice <= 0) return 0;

      return amount * (discountValue / totalPrice);
    }

    /// غير كده اعتبره نسبة مئوية
    return amount * (discountValue / 100);
  }

  AvailableUnitModel? _getMainUnit(SelectedProductClass element) {
    if (element.selectedMaxUnit != null) {
      return element.selectedMaxUnit;
    }

    final productUnitId = element.product.unit?.id;

    for (final unit in element.product.availableUnits) {
      if (unit.id == productUnitId) {
        return unit;
      }
    }

    if (element.product.availableUnits.isNotEmpty) {
      return element.product.availableUnits.first;
    }

    return null;
  }

  AvailableUnitModel? _getMinUnit(
      SelectedProductClass element,
      AvailableUnitModel? mainUnit,
      ) {
    if (element.selectedMinUnit != null) {
      return element.selectedMinUnit;
    }

    final remainderUnitId = mainUnit?.remainderUnit?.id;

    if (remainderUnitId == null) {
      return null;
    }

    for (final unit in element.product.availableUnits) {
      if (unit.id == remainderUnitId) {
        return unit;
      }
    }

    return null;
  }

  double _getUnitPrice(
      SelectedProductClass element,
      AvailableUnitModel? unit,
      ) {
    if (unit != null) {
      return unit.price.toDouble();
    }

    return element.product.sellingPrice.toDouble();
  }

  double _getUnitDiscount(
      SelectedProductClass element,
      AvailableUnitModel? unit,
      ) {
    if (unit != null) {
      return unit.discountAmount.toDouble();
    }

    return element.product.discountAmount.toDouble();
  }

  double _getUnitTaxRate(
      SelectedProductClass element,
      AvailableUnitModel? unit,
      ) {
    if (unit != null) {
      return unit.taxRate.toDouble();
    }

    return element.product.tax?.rate.toDouble() ?? 0;
  }
}

class SelectedProductClass {
  TripProductModel product;

  /// عدد الوحدات الكبيرة
  /// مثال: 2 كيلو
  int maxValueCounter;

  /// عدد الوحدات الصغيرة
  /// مثال: 500 جرام
  int minValueCounter;

  /// لو عاوز تختار وحدة كبيرة مختلفة من availableUnits
  /// مثال: طن أو كيلو
  AvailableUnitModel? selectedMaxUnit;

  /// لو عاوز تختار وحدة صغيرة مختلفة
  /// مثال: جرام
  AvailableUnitModel? selectedMinUnit;

  double discountMoney;

  SelectedProductClass({
    required this.product,
    this.maxValueCounter = 0,
    this.minValueCounter = 0,
    this.selectedMaxUnit,
    this.selectedMinUnit,
    this.discountMoney = 0,
  });
}