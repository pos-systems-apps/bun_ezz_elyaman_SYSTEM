class CategoryProductsResponse {
  int currentPage;
  int lastPage;
  List<Product> categoryProducts;

  CategoryProductsResponse({
    required this.currentPage,
    required this.lastPage,
    required this.categoryProducts,
  });

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) =>
      CategoryProductsResponse(
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        categoryProducts: List<Product>.from(
            (json['products'] ?? json['stocks'])
                .map((item) => Product.fromJson(item))),
      );
}

//
class Product {
  int id;
  String nameAr;
  String nameEn;
  String maxDiscount;
  int unitValue;
  String productCode;
  double purchasePrice;
  double sellingPrice;
  String discountType;
  double discount;
  double quantity;
  String image;
  String taxesAmount;

  Product({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.maxDiscount,
    required this.unitValue,
    required this.productCode,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.discountType,
    required this.discount,
    required this.quantity,
    required this.image,
    required this.taxesAmount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        nameAr: json['title'] ?? "",
        nameEn: json['title_en'] ?? "",
        maxDiscount: json['max_discount'] ?? "0",
        unitValue: json['unit_value'] ?? 0,
        productCode: json['product_code'] ?? "0",
        purchasePrice: (json['purchase_price'].toDouble()) ?? 0,
        sellingPrice: (json['selling_price'].toDouble()) ?? 0,
        discountType: json['discount_type'] ?? "",
        discount: (json['discount'].toDouble()) ?? 0,
        quantity: (double.tryParse(json['quantity'].toString())) ?? 0,
        image: json['image'] ?? "",
        taxesAmount: json['taxes'] ?? "0",
      );
}
