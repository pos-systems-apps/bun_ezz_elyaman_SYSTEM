class EndPoints {
  static String baseUrl = "";

  ///
  /// api image
  static const imageBaseUrl = "storage/app/public/shop/";

  /// image
  static String getImageFromApi(String imageUrl) =>
      baseUrl + imageBaseUrl + imageUrl;
}
