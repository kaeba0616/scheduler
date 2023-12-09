import 'package:xml/xml.dart';

class facility {
  String mt10id;
  String la;
  String lo;

  facility({
    required this.mt10id,
    required this.la,
    required this.lo,
  });

  factory facility.fromXml(XmlElement xml) {
    return facility(
      mt10id: xml.findElements('mt10id').first.text,
      la: xml.findElements('la').first.text,
      lo: xml.findElements('lo').first.text,
    );
  }
}
