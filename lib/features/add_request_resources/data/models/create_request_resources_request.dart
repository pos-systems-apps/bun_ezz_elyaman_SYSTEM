class CreateRequestResourcesRequest {
  int type; // request or return
  List<ResourceItem> resourceItems;

  CreateRequestResourcesRequest({
    required this.type,
    required this.resourceItems,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": resourceItems.map((item) => item.toJson()).toList(),
      };
}

class ResourceItem {
  int itemId; //id
  double itemName; // item name
  double stock; //the quantity you want it
  double balance; // the quantity you have
  int unit; // 1,0 big or small

  ResourceItem({
    required this.itemId,
    required this.itemName,
    required this.stock,
    required this.balance,
    required this.unit,
  });

  Map<String, dynamic> toJson() => {
        "product_id": itemId,
        "product_name": itemName,
        "price": stock,
        "balance": balance,
        "unit": unit,
      };
}
