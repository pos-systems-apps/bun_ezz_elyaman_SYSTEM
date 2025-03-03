import 'dart:convert';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:pos_system/core/api/api_consumer.dart';
import 'package:pos_system/core/api/app_interceptor.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/features/sales/data/models/create_order_request.dart';

class HttpConsumer implements ApiConsumer {
  http.Client _client;

  HttpConsumer(this._client) {
    _client = InterceptedClient.build(
      interceptors: [getIt<AppInterceptor>()],
    );
  }

  @override
  Future<http.Response> get(String path, Map<String, String>? headers) async {
    final response = await _client.get(Uri.parse(path), headers: headers);
    return response;
  }

  @override
  Future<http.Response> put(String path, Map<String, dynamic>? body,
      Map<String, String>? headers) async {
    final response = await _client.put(Uri.parse(path),
        body: json.encode(body), headers: headers);
    return response;
  }

  @override
  Future<http.Response> post(String path, Map<String, dynamic>? body,
      Map<String, String>? headers) async {
    final response = await _client.post(Uri.parse(path),
        body: json.encode(body), headers: headers);
    return response;
  }

  @override
  Future<http.Response> multiPost(String path, Map<String, dynamic> body,
      Map<String, String>? headers) async {
    var request = http.MultipartRequest('POST', Uri.parse(path));
    if (headers != null) {
      request.headers.addAll(headers);
    }
    body.forEach((key1, value1) async {
      if (key1 == "images" && value1 is List<String>) {
        for (var item in value1) {
          request.files
              .add(await http.MultipartFile.fromPath(key1, item.toString()));
        }
      } else if (key1 == "img" || key1 == "image" ) {
        request.files
            .add(await http.MultipartFile.fromPath(key1, value1.toString()));
      } else if (key1 == "cart" && value1 is List<Cart>) {
        request.fields['cart'] =
            jsonEncode(value1.map((cart) => cart.toJson()).toList());
      } else {
        if (value1 != null) {
          request.fields[key1] = value1.toString();
        }
      }
    });
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    return response;
  }
}
