import 'dart:convert';

import 'package:flutter_application_2/core/enums/request_type.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'jsonplaceholder.typicode.com';

  //static const String baseApi = '/api/v2/';

  Future<dynamic> request({
    required RequestType type,
    required String subRoute,
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? body,
  }) async {
    //Uri url = Uri.https(baseUrl, baseApi + subRoute, params);
    Uri url = Uri.https(baseUrl, subRoute, params);

    http.Response response;

    switch (type) {
      case RequestType.get:
        response = await http.get(url, headers: headers);

      case RequestType.post:
        response = await http.post(
          url,
          headers: headers,
          body: json.encode(body),
        );

      case RequestType.put:
        response = await http.put(
          url,
          headers: headers,
          body: json.encode(body),
        );

      case RequestType.patch:
        response = await http.patch(
          url,
          headers: headers,
          body: json.encode(body),
        );

      case RequestType.delete:
        response = await http.delete(url, headers: headers);
    }

    return (response);
  }

  // Uri get fullUrl (String subRoute)=>Uri.https(baseUrl, subRoute);

  // Uri getFullUrl(String subRoute) {
  //   return Uri.https(baseUrl, subRoute);
  // }
}
