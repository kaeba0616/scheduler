import 'dart:collection';

import 'package:scheduler/models/event.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

// event 생성 코드
// final Map<DateTime, List<EventModel>> _kEventSource = {};

// Future<void> loadEvents(DateTime selectDate) async {
//   final stdate = DateFormat('yyyyMMdd').format(selectDate);
//   final eddate = DateFormat('yyyyMMdd').format(selectDate);

//   List<EventModel> events =
//       await ApiService.getEvents(stdate, eddate, signgucode: regionCode);

//   var kEventSource = LinkedHashMap<DateTime, List<EventModel>>(
//     equals: isSameDay,
//     hashCode: getHashCode,
//   );

//   for (var event in events) {
//     var date = DateTime.parse(event.prfpdfrom);
//     if (!kEventSource.containsKey(date)) {
//       kEventSource[date] = [];
//     }
//     kEventSource[date]?.add(event);
//   }
// }

Duration difference = kLastDay.difference(kFirstDay);
int daysDifference = difference.inDays;
// event 생성 코드
final _kEventSource = {
  for (var item in List.generate(daysDifference, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, kFirstDay.day + item):
        List.generate(1, (index) => const Event('Event Page'))
}..addAll({
    kToday: [
      const Event('Today\'s Event Page'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();

final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
