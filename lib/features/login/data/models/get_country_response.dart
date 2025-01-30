class GetCountryResponse {
  int id;
  String name;
  String code;

  GetCountryResponse({
    required this.id,
    required this.name,
    required this.code,
  });

  factory GetCountryResponse.fromJson(Map<String, dynamic> json) =>
      GetCountryResponse(
        id: json['id'],
        name: json['name'],
        code: json['code']??"",
      );
}
