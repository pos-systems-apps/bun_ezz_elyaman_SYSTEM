class CategoriesAndRegionsResponse {
  List<Category> categories;
  List<Region> regions;

  CategoriesAndRegionsResponse({
    required this.categories,
    required this.regions,
  });

  factory CategoriesAndRegionsResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesAndRegionsResponse(
      categories: List<Category>.from(
        json['categories'].map((x) => Category.fromJson(x)),
      ),
      regions: List<Region>.from(
        json['regions'].map((x) => Region.fromJson(x)),
      ),
    );
  }
}

class Category {
  int id;
  String name;
  int status;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'] ?? "",
      status: json['status'] ?? 0,
      image: json['image'] ?? "",
    );
  }
}

class Region {
  int id;
  String name;
  String nameEn;

  Region({
    required this.id,
    required this.name,
    required this.nameEn,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      name: json['name'] ?? "",
      nameEn: json['name_en'] ?? "",
    );
  }
}
