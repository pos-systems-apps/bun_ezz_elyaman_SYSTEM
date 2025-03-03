class CreateMonthlyPlanRequest {
  int customerId;
  String note;
  String date;

  CreateMonthlyPlanRequest({
    required this.customerId,
    required this.note,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "note": note,
        "date": date,
      };
}
