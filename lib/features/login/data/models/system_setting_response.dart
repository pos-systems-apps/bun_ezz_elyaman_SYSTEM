//
// class SystemSettingResponse {
//   SystemSettingResponseInfo systemSettingResponseInfo;
//
//   SystemSettingResponse({required this.systemSettingResponseInfo});
//
//   factory SystemSettingResponse.fromJson(Map<String, dynamic> json) =>
//       SystemSettingResponse(
//         systemSettingResponseInfo:
//         SystemSettingResponseInfo.fromJson(json['business_info']),
//       );
// }
//
// class SystemSettingResponseInfo {
//   String logo;
//   String paginationNumber;
//   String currency;
//
//   String shopName;
//   String shopAddress;
//   String shopPhone;
//   String shopEmail;
//   String footerText;
//   String country;
//   String stockLimit;
//   String timeZone;
//   String commercialRegistry;
//   String numberTax;
//   String mainColor;
//   String secondColor;
//   String baseURl;
//
//   SystemSettingResponseInfo({
//     required this.logo,
//     required this.paginationNumber,
//     required this.currency,
//     required this.shopName,
//     required this.shopAddress,
//     required this.shopPhone,
//     required this.shopEmail,
//     required this.footerText,
//     required this.country,
//     required this.stockLimit,
//     required this.timeZone,
//     required this.commercialRegistry,
//     required this.numberTax,
//     required this.mainColor,
//     required this.secondColor,
//     required this.baseURl,
//   });
//
//   factory SystemSettingResponseInfo.fromJson(Map<String, dynamic> json) =>
//       SystemSettingResponseInfo(
//         logo: json['shop_logo'],
//         // logo: EndPoints.getImageFromApi(json['shop_logo']),
//         paginationNumber: json['pagination_limit'],
//         currency: json['currency'],
//         shopName: json['shop_name'],
//         shopAddress: json['shop_address'],
//         shopPhone: json['shop_phone'] ?? "",
//         shopEmail: json['shop_email'] ?? "",
//         footerText: json['footer_text'] ?? "",
//         country: json['country'] ?? "",
//         stockLimit: json['stock_limit'] ?? "",
//         timeZone: json['time_zone'] ?? "",
//         commercialRegistry: json['vat_reg_no'] ?? "",
//         numberTax: json['number_tax'] ?? "",
//         mainColor: json['color1'] ?? "",
//         secondColor: json['color2'] ?? "",
//         baseURl: json['base_url'] ?? "",
//       );
// }
