import 'package:xml/xml.dart';

class EventDetail {
  final String mt20id;
  final String mt10id;
  final String prfnm;
  final String prfpdfrom;
  final String prfpdto;
  final String fcltynm;
  final String prfruntime;
  final String prfage;
  final String pcseguidance;
  final String poster;
  final String genrenm;
  final String dtguidance;
  final String prfcast;

  EventDetail.fromXml(XmlElement xml)
      : mt20id = xml.findElements('mt20id').first.text,
        mt10id = xml.findElements('mt10id').first.text,
        prfnm = xml.findElements('prfnm').first.text,
        prfpdfrom = xml.findElements('prfpdfrom').first.text,
        prfpdto = xml.findElements('prfpdto').first.text,
        fcltynm = xml.findElements('fcltynm').first.text,
        prfruntime = xml.findElements('prfruntime').first.text,
        prfage = xml.findElements('prfage').first.text,
        pcseguidance = xml.findElements('pcseguidance').first.text,
        poster = xml.findElements('poster').first.text,
        genrenm = xml.findElements('genrenm').first.text,
        dtguidance = xml.findElements('dtguidance').first.text,
        prfcast = xml.findElements('prfcast').first.text;

  @override
  String toString() => prfnm;
  // EventDetail.fromJson(Map<String, dynamic> xml)
  //     : mt20id = xml['mt20id'],
  //       mt10id = xml['mt10id'],
  //       prfnm = xml['prfnm'],
  //       prfpdfrom = xml['prfpdfrom'],
  //       prfpdto = xml['prfpdto'],
  //       fcltynm = xml['fcltynm'],
  //       prfruntime = xml['prfruntime'],
  //       prfage = xml['prfage'],
  //       pcseguidance = xml['pcseguidance'],
  //       poster = xml['poster'],
  //       genrenm = xml['genrenm'],
  //       dtguidance = xml['dtguidance'];
}
