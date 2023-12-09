// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:scheduler/models/event.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}
// class Event {
//   final String mt20id;
//   final String prfnm;
//   final String prfpdfrom;
//   final String prfpdto;
//   final String poster;
//   final String genrenm;
//   // final String fcltynm;

//   Event.fromJson(Map<String, dynamic> json)
//       : mt20id = json['mt20id'],
//         prfnm = json['prfnm'],
//         prfpdfrom = json['prfpdfrom'],
//         prfpdto = json['prfpdto'],
//         // fcltynm = json['fcltynm'],
//         poster = json['poster'],
//         genrenm = json['genrenm'];
// }

// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<EventModel>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);

// // event 생성 코드
// final _kEventSource = {
//   for (var item in List.generate(50, (index) => index))
//     DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
//         item % 4 + 1, (index) => EventModel('Event $item | ${index + 1}'))
// }..addAll({
//     kToday: [
//       const EventModel('Today\'s Event 1'),
//       const EventModel('Today\'s Event 2'),
//     ],
//   });

// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }

// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
