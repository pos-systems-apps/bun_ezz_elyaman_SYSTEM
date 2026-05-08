class CreateReturnOrderRequest {
  final int saleOrderId;
  final String? notes;
  final List<CreateSaleReturnItemRequest> items;

  CreateReturnOrderRequest({
    required this.saleOrderId,
    this.notes,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "sale_order_id": saleOrderId,
      if (notes != null && notes!.trim().isNotEmpty) "notes": notes,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }
}

class CreateSaleReturnItemRequest {
  final int productId;
  final int? unitId;
  final double quantity;
  final double unitPrice;
  final String? reason;
  final int? saleOrderItemId;

  CreateSaleReturnItemRequest({
    required this.productId,
    this.unitId,
    required this.quantity,
    required this.unitPrice,
    this.reason,
    this.saleOrderItemId,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      if (unitId != null) "unit_id": unitId,
      "quantity": quantity,
      "unit_price": unitPrice,
      if (reason != null && reason!.trim().isNotEmpty) "reason": reason,
      if (saleOrderItemId != null) "sale_order_item_id": saleOrderItemId,
    };
  }
}
