import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api {
  String baseUrl = 'https://grinder.koffiesoft.com/';

  Future<dynamic> apiJsonGet(
    String url,
  ) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers : $headers');
    log('api url : $baseUrl$url');

    http.Response r = await http.get(
      Uri.parse(baseUrl + url),
      headers: headers,
    );
    var data = json.decode(r.body);
    log('status code : ${r.statusCode}');

    return data;
  }

  Future<dynamic> apiJsonPost(
    String url,
    Map<String, dynamic> params,
  ) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers : $headers');
    log('api url : $baseUrl$url');

    var r = await http.post(Uri.parse(baseUrl + url),
        headers: headers,
        body: jsonEncode(params),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log('status code : ${r.statusCode}');

    return data;
  }

  Future<dynamic> apiJsonPostLogin(
    String url,
    Map<String, String> params,
  ) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    log('headers : $headers');
    log('api url : $baseUrl$url');

    var r = await http.post(Uri.parse(baseUrl + url),
        headers: headers,
        body: params,
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log('status code : ${r.statusCode}');

    return data;
  }
}
