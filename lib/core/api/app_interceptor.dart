import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/constant_keys.dart';

class AppInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers[ConstantKeys.contentType] = ConstantKeys.applicationJson;
    request.headers[ConstantKeys.acceptText] = ConstantKeys.applicationJson;
    request.headers[ConstantKeys.acceptLanguage] ='ar';
    debugPrint(request.toString());
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    debugPrint(response.toString());
    return response;
  }
}
