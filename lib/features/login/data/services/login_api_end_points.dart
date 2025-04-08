import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/constant_keys.dart';

class LoginApiEndPoints {



  static const systemSettingUrl = 'https://testnewpos.iqbrandx.com/api/v1/config';
  static final userSettingUrl = '${AppConstant.baseUrl}api/v1/dataadmin';
  static final loginUrl = '${AppConstant.baseUrl}api/v1/login';
  static final updateUserLocationUrl = '${AppConstant.baseUrl}api/v1/update/user';
}
