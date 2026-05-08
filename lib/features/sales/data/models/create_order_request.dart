class CreateOrderRequest {
  final int customerId;
  final String paymentMethod; // cash, credit, partial
  final double? discountAmount;
  final String? discountType; // fixed, percentage
  final String? dueDate; // yyyy-MM-dd
  final String? notes;
  final double? paidAmount;
  final List<CreateOrderItemRequest> items;

  CreateOrderRequest({
    required this.customerId,
    required this.paymentMethod,
    this.discountAmount,
    this.discountType,
    this.dueDate,
    this.notes,
    this.paidAmount,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "customer_id": customerId,
      "payment_method": paymentMethod,
      if (discountAmount != null) "discount_amount": discountAmount,
      if (discountType != null) "discount_type": discountType,
      if (dueDate != null) "due_date": dueDate,
      if (notes != null) "notes": notes,
      if (paidAmount != null) "paid_amount": paidAmount,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }
}

class CreateOrderItemRequest {
  final int productId;
  final int? unitId;
  final double quantity;
  final double unitPrice;
  final double? discount;
  final String? discountType; // fixed, percentage
  final double? taxAmount;

  CreateOrderItemRequest({
    required this.productId,
    this.unitId,
    required this.quantity,
    required this.unitPrice,
    this.discount,
    this.discountType,
    this.taxAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      if (unitId != null) "unit_id": unitId,
      "quantity": quantity,
      "unit_price": unitPrice,
      if (discount != null) "discount": discount,
      if (discountType != null) "discount_type": discountType,
      if (taxAmount != null) "tax_amount": taxAmount,
    };
  }
}