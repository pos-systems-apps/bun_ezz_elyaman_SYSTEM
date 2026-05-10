class AllRequestsResponse {
  final bool status;
  final String message;
  final AllRequestsData? data;
  final int code;

  AllRequestsResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  factory AllRequestsResponse.fromJson(Map<String, dynamic> json) {
    return AllRequestsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? AllRequestsData.fromJson(json['data'])
          : null,
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
      'code': code,
    };
  }
}

class AllRequestsData {
  final List<RequestModel> data;
  final RequestsMeta? meta;

  AllRequestsData({
    required this.data,
    required this.meta,
  });

  factory AllRequestsData.fromJson(Map<String, dynamic> json) {
    return AllRequestsData(
      data: json['data'] == null
          ? []
          : List<RequestModel>.from(
        json['data'].map((x) => RequestModel.fromJson(x)),
      ),
      meta: json['meta'] != null ? RequestsMeta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((x) => x.toJson()).toList(),
      'meta': meta?.toJson(),
    };
  }
}

class RequestModel {
  final int id;
  final String type;
  final String typeLabel;
  final DateTime? startDate;
  final DateTime? endDate;
  final int days;
  final String? reason;
  final String status;
  final String statusLabel;
  final DateTime? approvedAt;
  final String? rejectionReason;
  final DateTime? createdAt;

  RequestModel({
    required this.id,
    required this.type,
    required this.typeLabel,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.reason,
    required this.status,
    required this.statusLabel,
    required this.approvedAt,
    required this.rejectionReason,
    required this.createdAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      typeLabel: json['type_label'] ?? '',
      startDate: json['start_date'] != null
          ? DateTime.tryParse(json['start_date'])
          : null,
      endDate: json['end_date'] != null
          ? DateTime.tryParse(json['end_date'])
          : null,
      days: json['days'] ?? 0,
      reason: json['reason'],
      status: json['status'] ?? '',
      statusLabel: json['status_label'] ?? '',
      approvedAt: json['approved_at'] != null
          ? DateTime.tryParse(json['approved_at'])
          : null,
      rejectionReason: json['rejection_reason'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'type_label': typeLabel,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'days': days,
      'reason': reason,
      'status': status,
      'status_label': statusLabel,
      'approved_at': approvedAt?.toIso8601String(),
      'rejection_reason': rejectionReason,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}

class RequestsMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  RequestsMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory RequestsMeta.fromJson(Map<String, dynamic> json) {
    return RequestsMeta(
      currentPage: json['current_page'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      perPage: json['per_page'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'last_page': lastPage,
      'per_page': perPage,
      'total': total,
    };
  }
}