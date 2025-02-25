import 'package:pos_system/core/utils/app_constant.dart';

class EndPoints {
  static const String _imageBaseUrl = "storage/app/public/";

  String getImageFromApi(String imageUrl) {
    return AppConstant.baseUrl + _imageBaseUrl + imageUrl;
  }
}
