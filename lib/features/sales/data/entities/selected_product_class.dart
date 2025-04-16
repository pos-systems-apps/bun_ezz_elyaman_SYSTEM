import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';

///stop value tax
///الضريبة بتتحسب علي كل منتج والخصم الاضافي بيتحسب علي كل منتج
///لو نسبة بتضربها في كل قيمة ولو كمية وبتحولها لنسبة وتضربها في كل منتج وبعدها تجيب الضريبة تاني
///
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



  Map<String, double> getReseatData({int? discountTypeId, String? discount}) {
    totalReseat = 0;
    totalDiscount = 0;
    extraDiscount = 0;
    valueTax = 0;
    total = 0;


    for (var element in selectedProducts) {
      ///get total reseat
      totalReseat += _getProductTotalPriceInReseat(element);
      ///product discount
      totalDiscount += getProductDiscountPriceInReseat(element);
    }


    for (var element in selectedProducts) {

      ///product extra discount
      extraDiscount += _getProductExtraDiscountPriceInReseat(element,discountTypeId,discount,totalPrice:totalReseat-totalDiscount);

      ///product taxes
      valueTax += _getProductTaxesPriceInReseat(element,discountTypeId,discount,totalPrice:totalReseat-totalDiscount);

      ///total
      total += _getTotalReseat(element,discountTypeId,discount,totalPrice:totalReseat-totalDiscount);

    }
    return {
      "totalReseat":
          double.tryParse(AppConstant.confirmRoundTo3Numbers(totalReseat)) ?? 0,
      "totalDiscount":
          double.tryParse(AppConstant.confirmRoundTo3Numbers(totalDiscount)) ??
              0,
      "extraDiscount":
          double.tryParse(AppConstant.confirmRoundTo3Numbers(extraDiscount)) ??
              0,
      "valueTax":
          double.tryParse(AppConstant.confirmRoundTo3Numbers(valueTax)) ?? 0,
      "total":
          double.tryParse(AppConstant.confirmRoundTo3Numbers(total)) ?? 0,
    };
  }

  double _getProductTotalPriceInReseat(SelectedProductClass element) {
    if (element.minValueCounter == 0) {
      return (element.product.sellingPrice * element.maxValueCounter);
    } else {
      return ((element.maxValueCounter * element.product.unitValue) + element.minValueCounter) *
          (element.product.sellingPrice / element.product.unitValue);
    }
  }

  double getProductDiscountPriceInReseat(SelectedProductClass element) {
    double elementDiscount = AppConstant.getDiscountOnProduct(
        element.product.discountType,
        element.product.sellingPrice,
        element.product.discount);

    if (element.minValueCounter == 0) {
      return (elementDiscount * element.maxValueCounter);
    } else {
      return ((element.maxValueCounter * element.product.unitValue) +
              element.minValueCounter) *
          (elementDiscount / element.product.unitValue);
    }
  }

  double _getProductExtraDiscountPriceInReseat(SelectedProductClass element,int? discountTypeId, String? discount,{double totalPrice=0}) {
    if(discountTypeId==null && discount==null){
      return 0;
    }else{
      if(discountTypeId==1){
        double productAfterDiscount =  _getProductTotalPriceInReseat(element) - getProductDiscountPriceInReseat(element);
        return (productAfterDiscount * (((double.tryParse(discount!)??0) / totalPrice)));

      }else{
        double productAfterDiscount = _getProductTotalPriceInReseat(element) - getProductDiscountPriceInReseat(element);
        return (productAfterDiscount * ((double.tryParse(discount!) ?? 0)/100));
      }
    }
  }

  double _getProductTaxesPriceInReseat(SelectedProductClass element,int? discountTypeId, String? discount,{double totalPrice=0}) {

    double productAfterDiscount = _getProductTotalPriceInReseat(element) - getProductDiscountPriceInReseat(element) -_getProductExtraDiscountPriceInReseat(element, discountTypeId, discount,totalPrice: totalPrice);
    return (productAfterDiscount * ((double.tryParse(element.product.taxesAmount) ?? 0)/100));
  }

  double _getTotalReseat(SelectedProductClass element,int? discountTypeId, String? discount,{double totalPrice=0}) {
    return (_getProductTotalPriceInReseat(element) - getProductDiscountPriceInReseat(element) - _getProductExtraDiscountPriceInReseat(element, discountTypeId, discount,totalPrice: totalPrice) + _getProductTaxesPriceInReseat(element, discountTypeId, discount,totalPrice: totalPrice));
  }
}

class SelectedProductClass {
  Product product;
  int maxValueCounter;
  int minValueCounter;

  SelectedProductClass({
    required this.product,
    this.maxValueCounter = 0,
    this.minValueCounter = 0,
  });
}
