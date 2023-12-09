import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scheduler/constants/constant.dart';
import 'package:scheduler/models/event.dart';
import 'package:scheduler/services/api_Service.dart';
import 'package:scheduler/widgets/event_widget.dart';

class EventScreen extends StatefulWidget {
  final regionEvent;
  final selectedDate;

  const EventScreen({
    super.key,
    required this.regionEvent,
    required this.selectedDate,
  });

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late final Future<List<EventModel>> events;
  late final regionNum;
  late final selectedDateStr;
  DateFormat format = DateFormat("yyyyMMdd");

  @override
  void initState() {
    super.initState();
    selectedDateStr = format.format(widget.selectedDate);
    regionNum = regionCode[widget.regionEvent];
    events = ApiService.getEvents(selectedDateStr, selectedDateStr,
        signgucode: regionNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.regionEvent}\'s Events | Date : $selectedDateStr'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: events,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: makeList1(snapshot),
                  ),
                  Expanded(
                    child: makeList2(snapshot),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  ListView makeList1(AsyncSnapshot<List<EventModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length ~/ 2,
      itemBuilder: (context, index) {
        print(index);
        var event = snapshot.data![index];
        return EventWidget(
            mt20id: event.mt20id,
            prfnm: event.prfnm,
            poster: event.poster,
            fcltynm: event.fcltynm);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }

  ListView makeList2(AsyncSnapshot<List<EventModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length ~/ 2,
      itemBuilder: (context, index) {
        print(index);
        var event = snapshot.data![index + snapshot.data!.length ~/ 2];
        return EventWidget(
          mt20id: event.mt20id,
          prfnm: event.prfnm,
          poster: event.poster,
          fcltynm: event.fcltynm,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
