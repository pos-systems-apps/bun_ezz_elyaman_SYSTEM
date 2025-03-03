class AddMyRequestRequest {
  int type;
  String note;
  String? date;

  AddMyRequestRequest({
    required this.type,
    required this.note,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "note": note,
        if (date != null) "date": date,
      };
}
