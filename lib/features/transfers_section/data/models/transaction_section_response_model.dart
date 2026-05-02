// class TransactionSectionResponseModel {
//   int id;
//   double amount;
//   String note;
//   bool active;
//
//   TransactionSectionResponseModel({
//     required this.id,
//     required this.amount,
//     required this.note,
//     required this.active,
//   });
//
//   factory TransactionSectionResponseModel.fromJson(Map<String, dynamic> json) {
//     return TransactionSectionResponseModel(
//       id: json['id'],
//       amount: double.tryParse(json['amount'].toString()) ?? 0,
//       note: json['note']??"",
//       active: json['active'] == 0,
//     );
//   }
//
//   static List<TransactionSectionResponseModel> fromJsonList(List<dynamic> jsonList) {
//     return jsonList.map((json) => TransactionSectionResponseModel.fromJson(json)).toList();
//   }
// }
