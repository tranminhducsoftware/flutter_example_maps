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
import 'package:ttp_maps/src/core/auth/forgot_password/screens/forgot_password_screen.dart';
import 'package:ttp_maps/src/core/auth/login/screens/sign_in_screen.dart';
import 'package:ttp_maps/src/core/auth/register/screens/sign_up_screen.dart';
import 'package:ttp_maps/src/core/auth/splash/screens/splash_screen.dart';
import 'package:ttp_maps/src/modules/dashboard/screens/components/camera_screen.dart';
import 'package:ttp_maps/src/modules/dashboard/screens/home_screen.dart';
import 'package:ttp_maps/src/modules/maps/screens/maps_screen.dart';
import 'package:ttp_maps/src/modules/profile/screens/profile_screen.dart';

var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SplashScreen();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SignInScreen();
});

var registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SignUpScreen();
});

var forgotPasswordHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ForgotPasswordScreen();
});

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeScreen();
});

var profileHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ProfileScreen();
});

var mapsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MapsScreen();
});

var cameraHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return CameraScreen();
    });