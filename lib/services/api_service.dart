import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:scheduler/models/event.dart';
import 'package:scheduler/models/eventDetail.dart';
import 'package:xml/xml.dart';

class ApiService {
  static const String BASE_URL = "kopis.or.kr";
  static const String PATH = "/openApi/restful/pblprfr";
  DateFormat format = DateFormat("yyyyMMdd");
  static late final String regionCode;

  static Future<List<EventModel>> getEvents(
    // String shcate,
    String stdate,
    String eddate, {
    String cpage = "1",
    String rows = "10",
    String signgucode = "11",
  }) async {
    List<EventModel> eventsInstances = [];
    final queryParameters = {
      // 'shcate' : shcate,
      'service': dotenv.get("API_KEY"),
      'stdate': stdate,
      'eddate': eddate,
      'cpage': cpage,
      'rows': rows,
      'signgucode': signgucode,
    };

    final url = Uri.https(BASE_URL, PATH, queryParameters);

    print(url);
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final document = XmlDocument.parse(res.body);
      final events = document.findAllElements("db");
      // final List<dynamic> events = jsonDecode(res.body);
      for (var event in events) {
        eventsInstances.add(EventModel.fromXml(event));
      }

      // to check events' detail.

      for (var event in eventsInstances) {
        print("$event, ${event.genrenm}");
      }

      return eventsInstances;
    }
    throw Error();
  }

  static Future<EventDetail> getEventById(String id) async {
    final queryParameters = {
      'service': dotenv.get("API_KEY"),
    };

    final url = Uri.https(BASE_URL, "$PATH/$id", queryParameters);
    print(url);
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final document = XmlDocument.parse(res.body);
      final event = document.findAllElements("db").single;
      return EventDetail.fromXml(event);
    }
    throw Error();
  }
}
