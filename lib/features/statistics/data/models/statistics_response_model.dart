class StatisticsResponseModel {
  List<StatisticsData> statisticsData;
  ValueData maxValue;
  ValueData minValue;

  StatisticsResponseModel({
    required this.statisticsData,
    required this.maxValue,
    required this.minValue,
  });

  factory StatisticsResponseModel.fromJson(Map<String, dynamic> json) =>
      StatisticsResponseModel(
        statisticsData: List<StatisticsData>.from(json['revenueSummary']
            .map((item) => StatisticsData.fromJson(item))),
        maxValue: ValueData.fromJson(json['maxValue']),
        minValue: ValueData.fromJson(json['minValue']),
      );
}

class StatisticsData {
  String nameAr;
  String nameEn;
  double money;

  StatisticsData({
    required this.nameAr,
    required this.nameEn,
    required this.money,
  });

  factory StatisticsData.fromJson(Map<String, dynamic> json) => StatisticsData(
        nameAr: json['ar'] ?? "",
        nameEn: json['en'] ?? "",
        money: double.tryParse(json['value'].toString()) ?? 0,
      );
}

class ValueData {
  String nameAr;
  String nameEn;
  double value;

  ValueData({
    required this.nameAr,
    required this.nameEn,
    required this.value,
  });

  factory ValueData.fromJson(Map<String, dynamic> json) => ValueData(
        nameAr: json['ar'] ?? "",
        nameEn: json['en'] ?? "",
        value: double.tryParse(json['value'].toString()) ?? 0,
      );
}
