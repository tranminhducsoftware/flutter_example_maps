
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ttp_maps/src/config/routes/routes_handler.dart';
import 'package:ttp_maps/src/constants/routes_path.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });

    router.define(RoutesPath.root, handler: splashHandler);
    router.define(RoutesPath.login, handler: loginHandler);
    router.define(RoutesPath.register, handler: registerHandler);
    router.define(RoutesPath.forgot_password, handler: forgotPasswordHandler);
    router.define(RoutesPath.home, handler: homeHandler);
    router.define(RoutesPath.profile, handler: profileHandler);
    router.define(RoutesPath.maps, handler: mapsHandler);
    router.define(RoutesPath.camera, handler: cameraHandler);

  }
}
