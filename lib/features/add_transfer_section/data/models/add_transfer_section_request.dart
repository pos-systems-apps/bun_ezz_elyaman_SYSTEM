class AddTransferSectionRequest {
  int bankAccountId;
  String amount;
  String note;
  String? image;

  AddTransferSectionRequest({
    required this.bankAccountId,
    required this.amount,
    required this.note,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "account_id": bankAccountId,
        "amount": amount,
        "note": note,
        if (image != null) "img": image,
      };
}
