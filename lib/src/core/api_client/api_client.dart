import 'dart:convert';

import 'package:http/http.dart';

import 'api_constants.dart';

class ApiClient {
  late final Client _client;
  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(
      getPath(path, params),
      headers: ApiConstants.baseHeader,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(
      getPath(path, null),
      body: jsonEncode(params),
      headers: ApiConstants.baseHeader,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception(response.reasonPhrase);
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    String paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.baseUrl}$path');
  }
}
