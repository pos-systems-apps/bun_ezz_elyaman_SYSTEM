import 'dart:convert';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/app_interceptor.dart';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/services_locator.dart';


class HttpConsumer implements ApiConsumer {
  http.Client _client;

  HttpConsumer(this._client) {
    _client = InterceptedClient.build(
      interceptors: [getIt<AppInterceptor>()],
    );
  }

  @override
  Future<http.Response> get(String path, Map<String, String>? headers) async {
    final response = await _client.get(Uri.parse(EndPoints.baseUrl + path),
        headers: headers);
    return response;
  }

  @override
  Future<http.Response> put(String path, Map<String, dynamic>? body,
      Map<String, String>? headers) async {
    final response = await _client.put(Uri.parse(EndPoints.baseUrl + path),
        body: json.encode(body), headers: headers);
    return response;
  }

  @override
  Future<http.Response> post(String path, Map<String, dynamic>? body,
      Map<String, String>? headers) async {
    final response = await _client.post(Uri.parse(EndPoints.baseUrl + path),
        body: json.encode(body), headers: headers);
    return response;
  }

  @override
  Future<http.Response> multiPost(String path, Map<String, dynamic> body,
      Map<String, String>? headers) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(EndPoints.baseUrl + path));
    if (headers != null) {
      request.headers.addAll(headers);
    }
    body.forEach((key, value) async {
      if (key == "images") {
        for (var item in value as List<String>) {
          request.files
              .add(await http.MultipartFile.fromPath(key, item.toString()));
        }
      } else {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      }
    });
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    return response;
  }
}
