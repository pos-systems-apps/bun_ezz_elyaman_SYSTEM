class AddCustomerRequest {
  String nameAr;
  String nameEn;
  int regionId;
  String mobile;
  int typeId;

  String numberTax;
  String commercialNumber;
  String email;
  String city;
  String countryCode;
  String address;
  String? image;

  AddCustomerRequest({
    required this.nameAr,
    required this.nameEn,
    required this.regionId,
    required this.mobile,
    required this.typeId,
    required this.numberTax,
    required this.commercialNumber,
    required this.email,
    required this.city,
    required this.countryCode,
    required this.address,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "name": nameAr,
        if (nameEn.isNotEmpty) "name_en": nameEn,
        "region_id": regionId,
        "mobile": mobile,
        "type": typeId,
        if (numberTax.isNotEmpty) "tax_number": numberTax,
        if (commercialNumber.isNotEmpty) "c_history": commercialNumber,
        if (email.isNotEmpty) "email": email,
        if (city.isNotEmpty) "city": city,
        if (countryCode.isNotEmpty) "zip_code": countryCode,
        if (address.isNotEmpty) "address": address,
        if (image != null) "image": image,
      };
}
