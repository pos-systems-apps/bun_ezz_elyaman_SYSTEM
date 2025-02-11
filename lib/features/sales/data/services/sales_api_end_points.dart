class SalesApiEndPoints {
  static getCategoriesUrl(String baseUrl, int page) =>
      '${baseUrl}api/v1/category/list?offset=$page';

  static getCategoryProductsUrl(
          String baseUrl, int categoryID, int type, int page) =>
      '${baseUrl}api/v1/stocks/list?category_id=$categoryID&type=$type&offset=$page';

  static getSearchProductsUrl(
          String baseUrl, String name, int type, int page) =>
      '${baseUrl}api/v1/product/search?name=$name&type=$type&offset=$page';
}
