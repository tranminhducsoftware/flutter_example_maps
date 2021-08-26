import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ttp_maps/src/modules/maps/screens/components/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Body extends StatelessWidget {
  var circleMarkers = <CircleMarker>[
    CircleMarker(
        point: LatLng(51.5, -0.09),
        color: Colors.blue.withOpacity(0.7),
        borderStrokeWidth: 2,
        useRadiusInMeter: true,
        radius: 2000 // 2000 meters | 2 km
        ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea( child : FlutterMaps(circleMarkers: circleMarkers)),
    );
  }
}
