class BankAccountsResponseModel {
  int total;
  int limit;

  List<AccountsResponseData> accounts;

  BankAccountsResponseModel({
    required this.total,
    required this.limit,
    required this.accounts,
  });

  factory BankAccountsResponseModel.fromJson(Map<String, dynamic> json) =>
      BankAccountsResponseModel(
          total: json['total'],
          limit: json['limit'],
          accounts: List<AccountsResponseData>.from(json['accounts']
              .map((item) => AccountsResponseData.fromJson(item))));
}

class AccountsResponseData {
  int id;
  String accountName;
  String description;
  double balance;
  String accountPhoneNumber;

  AccountsResponseData({
    required this.id,
    required this.accountName,
    required this.description,
    required this.balance,
    required this.accountPhoneNumber,
  });

  factory AccountsResponseData.fromJson(Map<String, dynamic> json) =>
      AccountsResponseData(
        id: json['id'],
        accountName: json['account'] ?? "",
        description: json['description'] ?? "",
        balance: (json['balance'].toDouble()) ?? 0,
        accountPhoneNumber: json['account_number'] ?? "",
      );
}
