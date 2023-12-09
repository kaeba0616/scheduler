import 'package:xml/xml.dart';

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

class EventModel {
  final String mt20id;
  final String prfnm;
  final String prfpdfrom;
  final String prfpdto;
  final String poster;
  final String genrenm;
  final String fcltynm;

  EventModel.fromXml(XmlElement xml)
      : mt20id = xml.findElements('mt20id').first.text,
        prfnm = xml.findElements('prfnm').first.text,
        prfpdfrom = xml.findElements('prfpdfrom').first.text,
        prfpdto = xml.findElements('prfpdto').first.text,
        fcltynm = xml.findElements('fcltynm').first.text,
        poster = xml.findElements('poster').first.text,
        genrenm = xml.findElements('genrenm').first.text;

  // EventModel.fromXml(Map<String, dynamic> xml)
  //     : mt20id = xml['mt20id'],
  //       prfnm = xml['prfnm'],
  //       prfpdfrom = xml['prfpdfrom'],
  //       prfpdto = xml['prfpdto'],
  //       // fcltynm = xml['fcltynm'],
  //       poster = xml['poster'],
  //       genrenm = xml['genrenm'];

  @override
  String toString() => prfnm;
}

// class EventModel {
//   final String title;

//   const EventModel(this.title);

//   @override
//   String toString() => "${title}test";
// }
