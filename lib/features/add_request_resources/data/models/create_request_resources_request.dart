class CreateRequestResourcesRequest {
  final String? notes;
  final List<CreateRequestResourcesItemRequest> items;

  CreateRequestResourcesRequest({
    this.notes,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      if (notes != null && notes!.trim().isNotEmpty) "notes": notes,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }
}

class CreateRequestResourcesItemRequest {
  final int productId;
  final double quantity;
  final int? unitId;
  final String? notes;

  CreateRequestResourcesItemRequest({
    required this.productId,
    required this.quantity,
    this.unitId,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "quantity": quantity,
      if (unitId != null) "unit_id": unitId,
      if (notes != null && notes!.trim().isNotEmpty) "notes": notes,
    };
  }
}