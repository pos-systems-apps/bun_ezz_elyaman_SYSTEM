
class EndPoints {
  static const String imageBaseUrl = "storage/app/public/";
  static const String baseUrl = "https://bun.alemtayaz.shop/";

  static   getImageFromApi(String image){
    return baseUrl +imageBaseUrl+image;
  }

}
