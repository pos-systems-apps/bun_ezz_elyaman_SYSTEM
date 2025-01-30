class EndPoints {
  static const baseUrl = "https://syarahplus.sa";



  ///
  /// api image
  static const imageBaseUrl = "/storage/app/";

  /// image
  static String? getImageFromApi(String imageUrl) =>
      baseUrl + imageBaseUrl + imageUrl;

  static String? getImageFromShared(String? imageUrl) =>
      imageUrl?.replaceRange(0, baseUrl.length, "");
}
