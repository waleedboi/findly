import 'dart:convert';
import 'dart:developer';

import 'package:findly/Core/Custom/api_enum.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // String baseUrl = 'http://localhost:3009/api/';

  Future<http.Response> request(
      {required String endPoint,
      Map body = const {},
      Map<String, String>? header,
      RequestType type = RequestType.get}) async {
    log("request $endPoint");
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token') ?? "";

    // headers
    Map<String, String> headers =
        header ?? {"Access-Control-Allow-Origin": "*", 'Accept': '*/*'};
    if (type == RequestType.get) {
      return await http.get(Uri.parse(endPoint), headers: headers);
    } else if (type == RequestType.post) {
      return await http.post(Uri.parse(endPoint), body: body, headers: headers);
    } else if (type == RequestType.put) {
      return await http.put(Uri.parse(endPoint), body: body, headers: headers);
    } else if (type == RequestType.delete) {
      return await http.delete(Uri.parse(endPoint), headers: headers);
    } else if (type == RequestType.patch) {
      return await http.patch(Uri.parse(endPoint),
          body: body, headers: headers);
    } else {
      return await http.get(Uri.parse(endPoint), headers: headers);
    }
  }

  Future<http.Response> request2({
    required Uri endPoint,
    Object body = const {},
    Map<String, String>? header,
    RequestType type = RequestType.get,
  }) async {
    log("request $endPoint");

    // headers
    Map<String, String> headers = header ??
        {
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*',
          'Content-Type':
              'application/json', // Ensure Content-Type is set to application/json
        };

    if (type == RequestType.get) {
      return await http.get(endPoint, headers: headers);
    } else if (type == RequestType.post) {
      return await http.post(
        endPoint,
        body: jsonEncode(body), // JSON encode the body
        headers: headers,
      );
    } else if (type == RequestType.put) {
      return await http.put(
        endPoint,
        body: jsonEncode(body), // JSON encode the body
        headers: headers,
      );
    } else if (type == RequestType.delete) {
      return await http.delete(endPoint, headers: headers);
    } else if (type == RequestType.patch) {
      return await http.patch(
        endPoint,
        body: jsonEncode(body), // JSON encode the body
        headers: headers,
      );
    } else {
      return await http.get(endPoint, headers: headers);
    }
  }
}
