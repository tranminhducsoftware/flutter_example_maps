import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ttp_maps/src/constants/app_constants.dart';
import 'package:ttp_maps/src/modules/maps/screens/plugins/scale_layer_plugin_option.dart';
import 'package:ttp_maps/src/modules/maps/screens/plugins/zoombuttons_plugin_option.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class FlutterMaps extends StatelessWidget {
  final List<CircleMarker> circleMarkers;

  const FlutterMaps({
    Key key,
    this.circleMarkers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(21.030653, 105.847130),
          zoom: 15,
          plugins: [
            ScaleLayerPlugin(),
            ZoomButtonsPlugin(),
            LocationMarkerPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: 'http://www.google.cn/maps/vt?lyrs=m@189&gl=cn&x={x}&y={y}&z={z}',
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
              )
            ],
            polygonCulling: true,
          ),
        ],

        nonRotatedLayers: [
          ScaleLayerPluginOption(
            lineColor: kPrimaryColor,
            lineWidth: 2,
            textStyle: TextStyle(color: kPrimaryColor, fontSize: 14),
            padding: EdgeInsets.all(10),
          ),
          ZoomButtonsPluginOption(
            alignment: Alignment.topRight,
            minZoom: 4,
            maxZoom: 19,
            mini: true,
            zoomInColorIcon: Colors.white,
            zoomOutColorIcon: Colors.white,
            zoomOutColor: kPrimaryColor.withOpacity(0.7),
            zoomInColor: kPrimaryColor.withOpacity(0.7),
            padding: 10,
            // alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}
