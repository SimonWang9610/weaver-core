import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // MediaType

import '../models/res_body.dart';
import '../models/asset_file.dart';
import 'constants.dart';
import 'store_util.dart';

class HttpUtil {
  static String _baseUri = _prepBaseUri();

  static String _prepBaseUri() {
    // in DEV mode, devBaseUri is common for web and devices
    if (Constants.isDev) {
      // dev URL for both web and devices
      return Constants.devBaseUri;
    } else {
      // absolute URL for iOS and android devices
      return Constants.prodBaseUri;
    }
  }

  static dynamic _getUri(String path) {
    String url = _baseUri + path;
    String? language = StoreUtil.read(Constants.KEY_LOCALE);
    if (language != null && !language.isEmpty) {
      url += '?lang=' + language;
    }

    return Uri.parse(url);
  }

  static Map<String, String> _createHeaders() {
    final headers = {'Content-type': 'application/json'};
    String? accessToken = StoreUtil.read(Constants.KEY_TOKEN);

    if (accessToken != null && !accessToken.isEmpty) {
      headers['Authorization'] = 'Bearer ' + accessToken;
    }

    return headers;
  }

  static String getGet(String path) {
    String url = _baseUri + path;
    String? accessToken = StoreUtil.read(Constants.KEY_TOKEN);

    if (accessToken != null && !accessToken.isEmpty) {
      return url += '?token=' + accessToken;
    }

    return url;
  }

  static Future<ResBody> get(String url) async {
    final headers = _createHeaders();
    ResBody resBody;

    try {
      final res = await http.get(
        _getUri(url),
        headers: headers,
      );
      final map = json.decode(res.body);
      resBody = ResBody.fromMap(map);
    } catch (e) {
      resBody = ResBody(success: false, message: e.toString());
    }

    return resBody;
  }

  static Future<ResBody> put(String url, {data, requestToken = true}) async {
    data = data ?? {};

    final headers = _createHeaders();
    ResBody resBody;

    try {
      final res = await http.put(
        _getUri(url),
        headers: headers,
        body: json.encode(data),
      );
      final map = json.decode(res.body);
      resBody = ResBody.fromMap(map);
    } catch (e) {
      resBody = ResBody(success: false, message: e.toString());
    }

    return resBody;
  }

  static Future<ResBody> post(String url, {data, requestToken = true}) async {
    data = data ?? {};

    final headers = _createHeaders();
    ResBody resBody;

    try {
      final res = await http.post(
        _getUri(url),
        headers: headers,
        body: json.encode(data),
      );
      final map = json.decode(res.body);
      resBody = ResBody.fromMap(map);
    } catch (e) {
      resBody = ResBody(success: false, message: e.toString());
    }

    return resBody;
  }

  static Future<ResBody> delete(String url, {data, requestToken = true}) async {
    data = data ?? {};

    final headers = _createHeaders();
    ResBody resBody;

    try {
      final res = await http.delete(
        _getUri(url),
        headers: headers,
        body: json.encode(data),
      );
      final map = json.decode(res.body);
      resBody = ResBody.fromMap(map);
    } catch (e) {
      resBody = ResBody(success: false, message: e.toString());
    }

    return resBody;
  }

  static Future<ResBody> upload(String url, AssetFile file,
      {data, requestToken = true}) async {
    data = data ?? {};

    final headers = _createHeaders();
    var request = new http.MultipartRequest('POST', _getUri(url));

    request.headers.addAll(headers);
    request.fields.addAll(data);
    request.files.add(await http.MultipartFile.fromBytes('files[]', file.bytes,
        contentType:
            MediaType.parse(file.type), //MediaType('application', fileType),
        filename: file.name));

    ResBody resBody;

    try {
      final http.StreamedResponse response = await request.send();
      final res = await http.Response.fromStream(response);
      final map = json.decode(res.body);
      resBody = ResBody.fromMap(map);
    } catch (e) {
      resBody = ResBody(success: false, message: e.toString());
    }

    return resBody;
  }
}
