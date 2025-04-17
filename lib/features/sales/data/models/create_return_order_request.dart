class CreateReturnOrderRequest {
  String orderId;
  Map<String, double> returnQuantitiesHidden;
  Map<String, int> returnUnitHidden;
  String date;

  CreateReturnOrderRequest({
    required this.orderId,
    required this.returnQuantitiesHidden,
    required this.returnUnitHidden,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'return_quantities_hidden': returnQuantitiesHidden,
        'return_unit_hidden': returnUnitHidden,
        'date': date,
      };
}
