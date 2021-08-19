/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 *
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:maps/config/router/routes_handler.dart';
import 'package:maps/constants/routes_constants.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return;
        });
    router.define(RoutesConstants.root, handler: rootHandler);
    router.define(RoutesConstants.demoSimple, handler: demoRouteHandler);
    router.define(RoutesConstants.demoSimpleFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(RoutesConstants.demoFunc, handler: demoFunctionHandler);
    router.define(RoutesConstants.deepLink, handler: deepLinkHandler);

    router.define(RoutesConstants.map, handler: mapsRouteHandler);
  }
}