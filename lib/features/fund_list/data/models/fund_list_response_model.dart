class FundListResponseModel {
  List<BoxItem> boxList;
  Seller? seller;

  FundListResponseModel({required this.boxList, required this.seller});

  factory FundListResponseModel.fromJson(Map<String, dynamic> json) {
    return FundListResponseModel(
      seller: json['0'] != null && json['0']['seller'] != null
          ? Seller.fromJson(json['0']['seller'])
          : null,
      boxList: List<BoxItem>.from(
          json['boxlist'].map((item) => BoxItem.fromJson(item))).toList(),
    );
  }
}

class BoxItem {
  String nameAr;
  String nameEn;
  double value;

  BoxItem({required this.nameAr, required this.nameEn, required this.value});

  factory BoxItem.fromJson(Map<String, dynamic> json) {
    return BoxItem(
      nameAr: json['ar'],
      nameEn: json['en'],
      value: double.tryParse(json['value'].toString()) ?? 0,
    );
  }
}

class Seller {
  int id;
  String name;

  Seller({
    required this.id,
    required this.name,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json['id'],
        name: (json['f_name'] ?? "") + (json['l_name'] ?? ""),
      );
}
