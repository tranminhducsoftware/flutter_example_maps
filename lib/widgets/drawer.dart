import 'package:flutter/material.dart';
import 'package:maps/constants/routes_constants.dart';
import 'package:maps/core/settings/application_setting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

Widget _buildMenuItem(BuildContext context, Widget title, String routeName,
    String currentRoute, TransitionType transitionType) {
  void tappedMenuButton(
      BuildContext context, String route, TransitionType transitionType) {
    Application.router.navigateTo(context, route, transition: transitionType);
  }

  var isSelected = routeName == currentRoute;

  return ListTile(
    title: title,
    selected: isSelected,
    onTap: () {
      tappedMenuButton(context, routeName, transitionType);
    },
  );
}

Drawer buildDrawer(BuildContext context, String currentRoute) {
  final drawerHeader = UserAccountsDrawerHeader(
    accountName: Text("Tuyệt vời đó"),
    accountEmail: Text("Hay lắm"),
    currentAccountPicture: const CircleAvatar(
      child: FlutterLogo(size: 42.0),
    ),
  );
  final drawerItems = ListView(
    children: <Widget>[
      drawerHeader,
      _buildMenuItem(context, const Text('OpenStreetMap'), RoutesConstants.root,
          currentRoute, TransitionType.native),
      _buildMenuItem(context, const Text('NetworkTileProvider'),RoutesConstants.map,
          currentRoute, TransitionType.native),
      _buildMenuItem(context, const Text('WMS Layer'),RoutesConstants.demoFunc,
          currentRoute, TransitionType.native),
      _buildMenuItem(context, const Text('Custom CRS'),RoutesConstants.deepLink,
          currentRoute, TransitionType.native)
    ],
  );
  return Drawer(child: drawerItems);
}
