class CreateRequestResourcesRequest {
  int type; // request or return
  List<ResourceItem> resourceItems;

  CreateRequestResourcesRequest({
    required this.type,
    required this.resourceItems,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": resourceItems,
      };
}

class ResourceItem {
  int itemId; //id
  String itemName; // item name
  double requestQuantity; //the quantity you want it
  double yourQuantity; // the quantity you have
  double price; // price
  // int unit; // 1,0 big or small

  ResourceItem({
    required this.itemId,
    required this.itemName,
    required this.requestQuantity,
    required this.yourQuantity,
    required this.price,
    // required this.unit,
  });

  Map<String, dynamic> toJson() => {
        "product_id": itemId,
        "product_name": itemName,
        "stock": requestQuantity,
        "balance": yourQuantity,
        "price": price,
      };
}
