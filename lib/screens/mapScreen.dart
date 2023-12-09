import 'package:flutter/material.dart';
import 'package:scheduler/widgets/map_widget.dart';

class MapScreen extends StatelessWidget {
  final String id, address;
  const MapScreen({
    super.key,
    required this.id,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(address),
      ),
      body: Center(
        child: MapWidget(
          id: id,
        ),
      ),
    );
  }
}
