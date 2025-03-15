import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/constant_keys.dart';

class LoginApiEndPoints {
  // static const appSettingUrl = 'https://testnewpos.iqbrandx.com/api/v1/config';
  //
  static const appSettingUrl = 'https://gamalsystem.iqbrandx.com/api/v1/config';

  static final loginUrl = '${AppConstant.baseUrl}api/v1/login';
}
