import 'package:flutter/material.dart';
import 'package:scheduler/screens/eventDetail.dart';

class EventWidget extends StatelessWidget {
  final String mt20id, prfnm, poster;
  const EventWidget({
    super.key,
    required this.mt20id,
    required this.prfnm,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              mt20id: mt20id,
              prfnm: prfnm,
              poster: poster,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Hero(
              tag: mt20id,
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Image.network(
                  poster,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: SizedBox(
                width: 160,
                child: SingleChildScrollView(
                  child: Text(
                    prfnm,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
