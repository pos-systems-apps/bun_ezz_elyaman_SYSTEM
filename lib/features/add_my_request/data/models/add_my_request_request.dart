class AddMyRequestRequest {
  final String type;
  final String startDate;
  final String endDate;
  final String? reason;

  AddMyRequestRequest({
    required this.type,
    required this.startDate,
    required this.endDate,
    this.reason,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "start_date": startDate,
      "end_date": endDate,
      if (reason != null && reason!.trim().isNotEmpty) "reason": reason,
    };
  }
}
