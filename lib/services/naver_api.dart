import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart' as http;

class NaverApi {
  static const String BASE_URL = "naveropenapi.apigw.ntruss.com";
  static String PATH = "/map-geocode/v2/geocode";

  static init() async {
    print("NaverApi.init()");
    await NaverMapSdk.instance.initialize(
      clientId: dotenv.env["NAVER_MAP_CLIENT_ID"]!,
      onAuthFailed: (e) {
        print("$e 이 에러 발생했음 (NaverAPi.init())");
      },
    );
  }

  static Future<NLatLng?> Geocode(
    String address,
  ) async {
    final queryParameters = {
      'query': address,
      // 'coordinate': "${latLng.latitude},${latLng.longitude}"
    };

    final url = Uri.https(BASE_URL, PATH, queryParameters);

    final headers = {
      'X-NCP-APIGW-API-KEY-ID': dotenv.env["NAVER_CLIENT_ID"]!,
      'X-NCP-APIGW-API-KEY': dotenv.env["NAVER_CLIENT_SECRET"]!,
    };

    log(headers.toString());

    try {
      final res = await http.get(url, headers: headers);
      log(res.body.toString());
      if (res.statusCode == 200) {
        final result = jsonDecode(res.body);
        List addresses = result.jsonDecode['addresses'];
        if (address.isNotEmpty) {
          final address = addresses.first;
          double x = double.parse(address['x']);
          double y = double.parse(address['y']);
          return NLatLng(x, y);
        } else {
          print('주소가 없음');
        }
      }
    } catch (e) {
      print("geocode 에러 발생함 : $e");
    }
    return null;
  }
}
