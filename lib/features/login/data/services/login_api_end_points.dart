import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/constant_keys.dart';

class LoginApiEndPoints {
  // static const systemSettingUrl = 'https://gamalsystem.iqbrandx.com/api/v1/config';
  // static final userSettingUrl = '${EndPoints.baseUrl}api/v1/dataadmin';
  static final loginUrl = '${EndPoints.baseUrl}api/delegate/login';
  static final logOutUrl = '${EndPoints.baseUrl}api/delegate/logout';
  static final updateUserLocationUrl = '${EndPoints.baseUrl}api/delegate/update-location';
}
