import 'package:flutter/material.dart';
import 'package:scheduler/models/eventDetail.dart';
import 'package:scheduler/screens/mapScreen.dart';
import 'package:scheduler/services/api_service.dart';
import 'package:scheduler/widgets/detail_widget.dart';

class DetailScreen extends StatefulWidget {
  final String mt20id;
  final String prfnm;
  final String poster;
  final String fcltynm;
  const DetailScreen({
    super.key,
    required this.mt20id,
    required this.prfnm,
    required this.poster,
    required this.fcltynm,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<EventDetail> eventD;
  late String id;
  @override
  void initState() {
    super.initState();
    eventD = ApiService.getEventById(widget.mt20id);
    print("$eventD + detailScreen");
  }

  String getid(EventDetail eventD) {
    EventDetail event = eventD;
    id = event.mt10id;
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prfnm),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Hero(
                      tag: widget.mt20id,
                      child: Container(
                        width: 200,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),

                          // 긴 title만 boxshadow가 이상하게 적용되는 문제가 있음 (ms)
                          // boxShadow: [
                          //   BoxShadow(
                          //     blurRadius: 10,
                          //     offset: const Offset(5, 5),
                          //     color: Colors.black.withOpacity(0.5),
                          //   ),
                          // ],
                        ),
                        child: Image.network(
                          widget.poster,
                          headers: const {
                            "User-Agent":
                                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36"
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: eventD,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(
                              address: widget.prfnm,
                              id: getid(snapshot.data as EventDetail),
                            ),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                      child: DetailWidget(
                        mt20id: widget.mt20id,
                        event: snapshot.data as EventDetail,
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
