import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart' as http;

class NaverSearchApi {
  static const String _BASE_URL = 'openapi.naver.com';
  static const String _LOCAL_SEARCH_PATH = '/v1/search/local.json';

  static Future<NLatLng?> searchLatLng(String query) async {
    final queryParameters = {
      'query': query,
      'display': '1',
      'sort': 'random',
    };

    log(query);

    final headers = {
      'X-Naver-Client-Id': dotenv.env['NAVER_SEARCH_CLIENT_ID']!,
      'X-Naver-Client-Secret': dotenv.env['NAVER_SEARCH_CLIENT_SECRET']!,
    };

    log(headers.toString());

    final url = Uri.https(_BASE_URL, _LOCAL_SEARCH_PATH, queryParameters);
    log(url.toString());
    try {
      final response = await http.get(url, headers: headers);
      log(response.body.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List results = jsonResponse['item'];
        if (results.isNotEmpty) {
          final NLatLng latlng =
              NLatLng(results[0]['mapx'], results[0]['mapy']);
          return latlng;
        } else {
          log('$query : 위도 경도 검색 결과가 없습니다.');
        }
      }
    } catch (e) {
      log('searchLatLng failed: $e');
    }
    return null;
  }
}
