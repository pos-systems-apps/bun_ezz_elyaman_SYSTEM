class AddCustomerRequest {
  String name;
  String mobile;
  String email;
  String? address;

  AddCustomerRequest({
    required this.name,
    required this.mobile,
    required this.email,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": mobile,
        if (address != null) "address": address,
      };
}
