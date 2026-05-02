class StatisticsResponseModel {
  final bool status;
  final String message;
  final List<StatisticItemModel> data;
  final int code;

  StatisticsResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory StatisticsResponseModel.fromJson(Map<String, dynamic> json) {
    return StatisticsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<StatisticItemModel>.from(
              json['data'].map(
                (item) => StatisticItemModel.fromJson(item),
              ),
            )
          : [],
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
      'code': code,
    };
  }
}

class StatisticItemModel {
  final String label;
  final num value;

  StatisticItemModel({
    required this.label,
    required this.value,
  });

  factory StatisticItemModel.fromJson(Map<String, dynamic> json) {
    return StatisticItemModel(
      label: json['label'] ?? '',
      value: json['value'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
    };
  }
}
