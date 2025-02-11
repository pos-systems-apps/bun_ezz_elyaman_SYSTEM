class CategoryResponse {
  int total;
  int limit;
  CategoryPagination categoryPagination;

  CategoryResponse({
    required this.total,
    required this.limit,
    required this.categoryPagination,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        total: json['total'],
        limit: json['limit'],
        categoryPagination: CategoryPagination.fromJson(json['categories']),
      );
}

class CategoryPagination {
  int currentPage;
  int lastPage;
  List<Category> categories;

  CategoryPagination({
    required this.currentPage,
    required this.lastPage,
    required this.categories,
  });

  factory CategoryPagination.fromJson(Map<String, dynamic> json) =>
      CategoryPagination(
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        categories: List<Category>.from(
            json['data'].map((item) => Category.fromJson(item))),
      );
}

class Category {
  int id;
  String name;
  String image;
  int type;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        type: json['type'],
      );
}
