class ConfirmCollectionRequestModel {
  int customerID;
  String noteText;
  List<String> items;

  ConfirmCollectionRequestModel({
    required this.customerID,
    required this.noteText,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
        "user_id": customerID,
        if (noteText.isNotEmpty) "note": noteText,
        'items': items,
      };
}
