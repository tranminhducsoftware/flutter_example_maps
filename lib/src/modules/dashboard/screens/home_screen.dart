import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ttp_maps/src/constants/app_constants.dart';
import 'package:ttp_maps/src/constants/routes_path.dart';
import 'package:ttp_maps/src/core/settings/application_setting.dart';
import 'package:ttp_maps/src/widgets/coustom_bottom_nav_bar.dart';
import 'package:ttp_maps/src/constants/app_enums.dart';
import 'package:ttp_maps/src/widgets/custom_drawer.dart';

import 'components/body.dart';
import 'components/icon_btn_with_counter.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        drawer: buildDrawer(context, RoutesPath.home),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: <Widget>[
        IconBtnWithCounter(
          svgSrc: "assets/icons/Bell.svg",
          numOfitem: 3,
          press: () {

          },
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/scan.svg", color: kPrimaryColor),
          onPressed: () {
            Application.router.navigateTo(context, RoutesPath.camera, transition:  TransitionType.inFromTop);
          },
        ),
      ],
    );
  }
}
