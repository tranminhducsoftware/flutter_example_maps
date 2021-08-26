import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'config/routes/routes.dart';
import 'config/theme/theme_config.dart';
import 'core/settings/application_setting.dart';

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Fluro',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}

