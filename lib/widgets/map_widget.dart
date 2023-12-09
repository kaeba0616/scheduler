import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:scheduler/models/facility.dart';
import 'package:scheduler/services/api_Service.dart';

class MapWidget extends StatefulWidget {
  final String id;

  const MapWidget({
    super.key,
    required this.id,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late final Future<facility> fac1;
  @override
  void initState() {
    print("initState- map_widget");
    super.initState();
    fac1 = ApiService.getFacilityById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        body: FutureBuilder(
          future: fac1,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator()); // 로딩 인디케이터 표시
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // 에러 메시지 표시
            } else {
              final NLatLng nLatLng = NLatLng(double.parse(snapshot.data!.la),
                  double.parse(snapshot.data!.lo));
              return SizedBox(
                width: 400,
                child: NaverMap(
                  options: NaverMapViewOptions(
                    initialCameraPosition: NCameraPosition(
                      target: nLatLng,
                      zoom: 16,
                    ),
                  ),
                  onMapReady: (controller) {
                    print("onMapReady - 로딩됨");
                  },
                ),
              );
            }
          },
        ),
      ),
    );
    // FutureBuilder<NLatLng>(
    //   future: futureNLatLng,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //           child: CircularProgressIndicator()); // 로딩 인디케이터 표시
    //     } else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}'); // 에러 메시지 표시
    //     } else {
    //       NLatLng nLatLng = snapshot.data!;
    //       return Scaffold(
    //         body: SizedBox(
    //           width: 200,
    //           child: NaverMap(
    //             options: NaverMapViewOptions(
    //               initialCameraPosition: NCameraPosition(
    //                 target: nLatLng,
    //                 zoom: 16,
    //               ),
    //             ),
    //             onMapReady: (controller) {
    //               print("onMapReady - 로딩됨");
    //             },
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';
// import 'package:scheduler/services/naver_api.dart';

// class MapWidget extends StatefulWidget {
//   final String address;
//   const MapWidget({
//     super.key,
//     required this.address,
//   });

//   @override
//   State<MapWidget> createState() => _MapWidgetState();
// }

// class _MapWidgetState extends State<MapWidget> {
//   late NLatLng NLLg;

//   @override
//   void initState() async {
//     super.initState();
//     NLatLng? NLLg = await NaverApi.Geocode(widget.address);

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: 200,
//         child: NaverMap(
//           options: NaverMapViewOptions(
//             initialCameraPosition: NCameraPosition(
//               target: NLLg,
//               zoom: 16,
//             ),
//           ),
//           onMapReady: (controller) {
//             print("onMapReady - 로딩됨");
//           },
//         ),
//       ),
//     );
//   }
// }
