import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';

class EndPoints {
  static String? _baseUrl;
  static const String _imageBaseUrl = "storage/app/public/shop/";

  static Future<void> setBaseUrl(String value) async {
    _baseUrl = value;
  }

  static Future<String> getBaseUrl() async {
    return EndPoints._baseUrl ??
        await CacheHelper.getSecuredString(ConstantKeys.saveBaseURLToShared);
  }

  static Future<String> getImageFromApi(String imageUrl) async {
    return (await getBaseUrl()) + _imageBaseUrl + imageUrl;
  }
}
