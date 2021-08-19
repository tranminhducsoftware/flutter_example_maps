/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 *
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps/widgets/drawer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/constants/routes_constants.dart';
import 'package:maps/utils/plugins/scale_layer_plugin_option.dart';
import 'package:maps/utils/plugins/zoombuttons_plugin_option.dart';

class HomeComponent extends StatelessWidget {
  static const String route = RoutesConstants.root;
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
    // final MapsBloc settingsBloc = BlocProvider.of<MapsBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('ScaleBarPlugins')),
      drawer: buildDrawer(context, HomeComponent.route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 5.0,
                  plugins: [
                    ScaleLayerPlugin(),
                    ZoomButtonsPlugin(),
                  ],
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                  CircleLayerOptions(circles: circleMarkers),
                  PolygonLayerOptions(
                    polygons: [
                      Polygon(
                        points: [
                          LatLng(51.5271154427087, -0.10266625180659351),
                          LatLng(51.52401819162466, 0.03055763602767048),
                          LatLng(51.47421967407655, 0.02575058852849477),
                          LatLng(51.48865188163204, -0.08000445645333089),
                          LatLng(51.498484547170605, -0.12979173412334788),
                          LatLng(51.53010569212588, -0.12532804715983617),
                          LatLng(51.54067678496067, -0.09803088457523981),
                        ],
                        color: Colors.blue.withOpacity(0.7),
                        // borderStrokeWidth: 3.0,
                        // borderColor: Colors.blueAccent,
                      )
                    ],
                    polygonCulling: true,
                  ),
                ],
                nonRotatedLayers: [
                  ScaleLayerPluginOption(
                    lineColor: Colors.blue,
                    lineWidth: 2,
                    textStyle: TextStyle(color: Colors.blue, fontSize: 12),
                    padding: EdgeInsets.all(10),
                  ),
                  ZoomButtonsPluginOption(
                    minZoom: 4,
                    maxZoom: 19,
                    mini: true,
                    padding: 10,
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
