class BankAccountsResponseModel {
  List<AccountsResponseData> accounts;

  BankAccountsResponseModel({

    required this.accounts,
  });

  factory BankAccountsResponseModel.fromJson(Map<String, dynamic> json) =>
      BankAccountsResponseModel(
          accounts: List<AccountsResponseData>.from(json['accounts']
              .map((item) => AccountsResponseData.fromJson(item))));
}

class AccountsResponseData {
  int id;
  String name;
  String description;
  double balance;
  String accountPhoneNumber;

  AccountsResponseData({
    required this.id,
    required this.name,
    required this.description,
    required this.balance,
    required this.accountPhoneNumber,
  });

  factory AccountsResponseData.fromJson(Map<String, dynamic> json) =>
      AccountsResponseData(
        id: json['id'],
        name: json['account'] ?? "",
        description: json['description'] ?? "",
        balance: (json['balance'].toDouble()) ?? 0,
        accountPhoneNumber: json['account_number'] ?? "",
      );
}
