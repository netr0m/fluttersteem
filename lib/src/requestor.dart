import 'dart:async';
import 'package:http/src/base_client.dart' as http;
import 'package:http/src/request.dart' as http;
import 'package:http/src/response.dart' as http;
import 'models/impl_models.dart';

abstract class Requestor {
  Uri buildUri(String path, {Map<String, String> queryParameters, String method});

  Map<String, String> buildBody(Map<String, String> body);

  Future<SteemResponse> request(String path, {Map<String, String> body, Map<String, String> queryParameters, String method}) {
    var uri = buildUri(path, queryParameters: queryParameters, method: method);
    var req = new http.Request(method ?? 'GET', uri);
    req.headers['accept'] = 'application/json';

    if (body?.isNotEmpty == true) {
      req.bodyFields = buildBody(body);
    }

    return send(req);
  }

  Future<SteemResponse> send(http.Request request);
}