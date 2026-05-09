class ConfirmCollectionRequestModel {
  final int? customerId;
  final String? notes;
  final List<ConfirmCollectionItemModel> items;

  ConfirmCollectionRequestModel({
    this.customerId,
    this.notes,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      if (customerId != null) "customer_id": customerId,
      if (notes != null && notes!.trim().isNotEmpty) "notes": notes,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }
}

class ConfirmCollectionItemModel {
  final int? saleOrderId;
  final String  amount;
  final String? notes;

  ConfirmCollectionItemModel({
    this.saleOrderId,
    required this.amount,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      if (saleOrderId != null) "sale_order_id": saleOrderId,
      "amount": amount,
      if (notes != null && notes!.trim().isNotEmpty) "notes": notes,
    };
  }
}