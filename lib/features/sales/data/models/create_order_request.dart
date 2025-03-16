class CreateOrderRequest {
  int userId; // user
  String? img; //
  double totalTax; //total tax amount
  double extraDiscount; //extra total discount
  double collectedCash; // money that payed
  int orderType; // 4,7      7 ==>mortag3
  double finalOrderAmount; // all money after discount and tax
  int cash; // shabaka , agel ,cash
  List<Cart> carts;

  CreateOrderRequest({
    required this.userId,
    required this.img,
    required this.totalTax,
    required this.extraDiscount,
    required this.collectedCash,
    required this.orderType,
    required this.finalOrderAmount,
    required this.cash,
    required this.carts,
  });

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        if(img!=null)"img": img,
        "total_tax": totalTax,
        "extra_discount": extraDiscount,
        "collected_cash": collectedCash,
        "order_type": orderType,
        "order_amount": finalOrderAmount,
        "cash": cash,
        "cart": carts.map((item) => item.toJson()).toList(),
      };
}

class Cart {
  int id; //id
  double quantity; // quantity for item
  double price; // price for one item
  int unit; // 1,0 big or small

  Cart({
    required this.id,
    required this.quantity,
    required this.price,
    required this.unit,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "price": price,
        "discount": 0,
        "tax": 0,
        "unit": unit,
      };
}
