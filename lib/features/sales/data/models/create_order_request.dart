class CreateOrderRequest {
  int userId; // user
  String? img; //
  String totalTax; //total tax amount
  String extraDiscount; //extra total discount
  String totalProductsDiscount; //products total discount
  String collectedCash; // money that payed
  int orderType; // 4,7      7 ==>mortag3
  String finalOrderAmount; // all money after discount and tax
  String allOrderAmount; // all money
  int cash; // shabaka , agel ,cash
  List<Cart> carts;

  CreateOrderRequest({
    required this.userId,
    required this.img,
    required this.totalTax,
    required this.extraDiscount,
    required this.totalProductsDiscount,
    required this.collectedCash,
    required this.orderType,
    required this.finalOrderAmount,
    required this.allOrderAmount,
    required this.cash,
    required this.carts,
  });

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        if(img!=null)"img": img,
        "total_tax": totalTax,
        "total_product_discounts": totalProductsDiscount,
        "extra_discount": extraDiscount,
        "collected_cash": collectedCash,
        "order_type": orderType,
        "order_amount": finalOrderAmount,
        "subtotal": allOrderAmount,
        "cash": cash,
        "cart": carts.map((item) => item.toJson()).toList(),
      };
}

class Cart {
  int id; //id
  double quantity; // quantity for item
  double price; // price for one item
  double tax; // tax for one item
  int unit; // 1,0 big or small


  Cart({
    required this.id,
    required this.quantity,
    required this.price,
    required this.tax,
    required this.unit,

  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "price": price,
        "discount": 0,
        "tax": tax,
        "unit": unit,
      };
}
