/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:maps/modules/maps/bloc/maps_bloc.dart';
import 'package:maps/modules/maps/repositories/areasService.dart';
import 'package:maps/utils/helpers/color_helpers.dart';
import 'package:maps/modules/demo/demo_simple_component.dart';
import 'package:maps/modules/dashboard/screens/dashboard_screens.dart';
import 'package:maps/modules/maps/screens/maps_screen.dart';
import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return HomeComponent();
    });

var demoRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? message = params["message"]?.first;
      String? colorHex = params["color_hex"]?.first;
      String? result = params["result"]?.first;
      Color color = Color(0xFFFFFFFF);
      if (colorHex != null && colorHex.length > 0) {
        color = Color(ColorHelpers.fromHexString(colorHex));
      }
      return DemoSimpleComponent(
          message: message ?? 'Testing', color: color, result: result);
    });

var demoFunctionHandler = Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? message = params["message"]?.first;
      showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Hey Hey!",
              style: TextStyle(
                color: const Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: Text("$message"),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("OK"),
                ),
              ),
            ],
          );
        },
      );
      return;
    });

/// Handles deep links into the app
/// To test on Android:
///
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
var deepLinkHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? colorHex = params["color_hex"]?.first;
      String? result = params["result"]?.first;
      Color color = Color(0xFFFFFFFF);
      if (colorHex != null && colorHex.length > 0) {
        color = Color(ColorHelpers.fromHexString(colorHex));
      }
      return DemoSimpleComponent(
          message: "DEEEEEP LINK!!!", color: color, result: result);
    });

var mapsRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return  BlocProvider(
        create: (context) => AreasBloc(areasRepo: AreasServices()),
        child: MapsPage(),
      );
    });


