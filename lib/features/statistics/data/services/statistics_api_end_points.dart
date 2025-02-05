import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/constant_keys.dart';

class LoginApiEndPoints {
  static const appSettingUrl = 'https://testnewpos.iqbrandx.com/api/v1/config';

  static String getBaseUrl() {
    return EndPoints.baseUrl.isEmpty
        ? CacheHelper.getSecuredString(ConstantKeys.saveBaseURLToShared)
        : EndPoints.baseUrl;
  }
  static final loginUrl = '${getBaseUrl()}api/v1/login';
}
