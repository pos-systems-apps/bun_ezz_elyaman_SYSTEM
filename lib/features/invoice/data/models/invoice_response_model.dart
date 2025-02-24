
class InvoiceResponseModel {
   bool success;
   Invoice invoice;

  InvoiceResponseModel({required this.success, required this.invoice});

  factory InvoiceResponseModel.fromJson(Map<String, dynamic> json) {
    return InvoiceResponseModel(
      success: json['success'],
      invoice: Invoice.fromJson(json['invoice']),
    );
  }
}

class Invoice {
   int id;
   int userId;
   double orderAmount;
   double totalTax;
   String createdAt;
   String updatedAt;
   List<InvoiceDetail> details;
   Seller seller;
   Customer customer;

  Invoice({
    required this.id,
    required this.userId,
    required this.orderAmount,
    required this.totalTax,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
    required this.seller,
    required this.customer,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      userId: json['user_id'],
      orderAmount: (json['order_amount'] as num).toDouble(),
      totalTax: (json['total_tax'] as num).toDouble(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      details: (json['details'] as List)
          .map((item) => InvoiceDetail.fromJson(item))
          .toList(),
      seller: Seller.fromJson(json['seller']),
      customer: Customer.fromJson(json['customer']),
    );
  }
}

class InvoiceDetail {
   int id;
   int productId;
   int orderId;
   double price;
   String productDetails;
   int quantity;

  InvoiceDetail({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.price,
    required this.productDetails,
    required this.quantity,
  });

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) {
    return InvoiceDetail(
      id: json['id'],
      productId: json['product_id'],
      orderId: json['order_id'],
      price: (json['price'] as num).toDouble(),
      productDetails: json['product_details'],
      quantity: json['quantity'],
    );
  }
}

class Seller {
   int id;
   String fName;
   String lName;
   String email;

  Seller({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      email: json['email'],
    );
  }
}

class Customer {
   int id;
   String name;
   String mobile;

  Customer({
    required this.id,
    required this.name,
    required this.mobile,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
    );
  }
}

