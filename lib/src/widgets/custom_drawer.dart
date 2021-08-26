import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ttp_maps/src/constants/app_constants.dart';
import 'package:ttp_maps/src/constants/routes_path.dart';
import 'package:ttp_maps/src/core/settings/application_setting.dart';
import 'package:ttp_maps/src/modules/profile/screens/components/profile_pic.dart';

Widget _buildMenuItem(BuildContext context, Widget title, IconButton icon,
    String routeName, String currentRoute, TransitionType transitionType) {
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
      leading: icon);
}

Drawer buildDrawer(BuildContext context, String currentRoute) {
  final drawerHeader = UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      color: kPrimaryColor.withOpacity(0.7),
    ),
    currentAccountPictureSize: const Size.square(85.0),
    accountName: Text(
      "Trần Minh Đức",
      style: TextStyle(fontSize: 15),
    ),
    currentAccountPicture: const CircleAvatar(
      child: ProfilePic(),
    ),
  );
  final drawerItems = ListView(
    children: <Widget>[
      drawerHeader,
      _buildMenuItem(
          context,
          const Text('Home',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: kPrimaryColor)),
          IconButton(
            icon: SvgPicture.asset("assets/icons/Shop Icon.svg",
                color: kPrimaryColor),
            onPressed: () {},
          ),
          RoutesPath.home,
          currentRoute,
          TransitionType.inFromRight),
      _buildMenuItem(
          context,
          const Text('Maps',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: kPrimaryColor)),
          IconButton(
            icon: SvgPicture.asset("assets/icons/map_icon.svg",
                color: kPrimaryColor),
            onPressed: () {},
          ),
          RoutesPath.maps,
          currentRoute,
          TransitionType.inFromRight),
      _buildMenuItem(
          context,
          const Text('Messages',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: kPrimaryColor)),
          IconButton(
            icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
                color: kPrimaryColor),
            onPressed: () {},
          ),
          RoutesPath.home,
          currentRoute,
          TransitionType.inFromRight),
      _buildMenuItem(
          context,
          const Text('Profile',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color:kPrimaryColor )),
          IconButton(
            icon: SvgPicture.asset("assets/icons/User Icon.svg",
                color: kPrimaryColor),
            onPressed: () {},
          ),
          RoutesPath.profile,
          currentRoute,
          TransitionType.inFromRight),
    ],
  );
  return Drawer(child: drawerItems);
}
