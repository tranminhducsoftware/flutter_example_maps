import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:location/location.dart';
import 'package:ttp_maps/src/constants/app_constants.dart';
import 'package:ttp_maps/src/constants/app_enums.dart';
import 'package:ttp_maps/src/modules/maps/screens/plugins/scale_layer_plugin_option.dart';
import 'package:ttp_maps/src/modules/maps/screens/plugins/zoombuttons_plugin_option.dart';
import 'package:ttp_maps/src/widgets/coustom_bottom_nav_bar.dart';
import 'package:latlong2/latlong.dart';

class MapsScreen extends StatefulWidget {
  static const String route = 'map_controller';

  @override
  MapControllerPageState createState() {
    return MapControllerPageState();
  }
}

class MapControllerPageState extends State<MapsScreen> {
  MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _moveToCurrent();
  }

  void _moveToCurrent() async {
    var location = Location();

    try {
      var currentLocation = await location.getLocation();
      mapController.move(
          LatLng(currentLocation.latitude, currentLocation.longitude), 15);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Scaffold(
          body: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(21.030653, 105.847130),
              zoom: 17,
              maxZoom: 19,
              plugins: [
                ScaleLayerPlugin(),
                ZoomButtonsPlugin(),
              ],
            ),
            nonRotatedLayers: [
              ScaleLayerPluginOption(
                lineColor: kPrimaryColor,
                lineWidth: 2,
                textStyle: TextStyle(color: kPrimaryColor, fontSize: 14),
                padding: EdgeInsets.all(30),
              ),
              ZoomButtonsPluginOption(
                alignment: Alignment.bottomLeft,
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
            children: [
              TileLayerWidget(
                options: TileLayerOptions(
                  urlTemplate:
                      'http://www.google.cn/maps/vt?lyrs=m@189&gl=cn&x={x}&y={y}&z={z}',
                  subdomains: ['a', 'b', 'c'],
                  maxZoom: 19,
                ),
              ),
              LocationMarkerLayerWidget(
                options: LocationMarkerLayerOptions(
                  marker: DefaultLocationMarker(
                    color: Colors.green,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  markerSize: const Size(40, 40),
                  accuracyCircleColor: Colors.green.withOpacity(0.1),
                  headingSectorColor: Colors.green.withOpacity(0.8),
                  headingSectorRadius: 120,
                  markerAnimationDuration: Duration.zero, // disable animation
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 5,
          bottom: 20,
          child: FloatingActionButton(
            backgroundColor: kPrimaryColor.withOpacity(0.7),
            onPressed: () {
              this._moveToCurrent();
            },
            child: Icon(
              Icons.my_location,
              color: Colors.white,
            ),
          ),
        ),
      ]),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.maps),
    );
  }
}
