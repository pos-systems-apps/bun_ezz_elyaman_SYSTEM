class ConfirmCollectionRequestModel {
  String billID;
  int? bankAccountID;
  int? paymentWayID;
  int? customerID;
  String price;
  String noteText;
  String? image;

  ConfirmCollectionRequestModel({
    required this.billID,
    required this.bankAccountID,
    required this.paymentWayID,
    required this.customerID,
    required this.price,
    required this.noteText,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        if (billID.isNotEmpty) "order_id": billID,
        if (bankAccountID != null) "payment_id": bankAccountID,
        if (paymentWayID != null) "cash": paymentWayID,
        if (customerID != null) "user_id": customerID,
        if (price.isNotEmpty) "price": price,
        if (noteText.isNotEmpty) "note": noteText,
        if (image != null) "img": image,
      };
}
