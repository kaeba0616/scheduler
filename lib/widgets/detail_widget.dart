import 'package:flutter/material.dart';
import 'package:scheduler/models/eventDetail.dart';

class DetailWidget extends StatelessWidget {
  final String mt20id;
  final EventDetail event;
  const DetailWidget({
    super.key,
    required this.mt20id,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(2, 2),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.green.shade400,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${event.prfnm} (${event.genrenm})",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "가격: ${event.pcseguidance}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "일시: ${event.prfpdfrom} ~ ${event.prfpdto}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "장소: ${event.fcltynm}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "공연 런타임: ${event.prfruntime}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
