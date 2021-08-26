import 'package:flutter/material.dart';
import 'package:ttp_maps/src/config/size_config.dart';
import 'package:ttp_maps/src/modules/dashboard/screens/components/camera_screen.dart';
import 'package:ttp_maps/src/modules/dashboard/screens/components/section_categories.dart';
import 'package:ttp_maps/src/modules/dashboard/screens/components/section_discount_banner.dart';
import 'package:ttp_maps/src/modules/dashboard/screens/components/section_help_card.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DiscountBanner(),
            SizedBox(height :getProportionateScreenHeight(20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Categories",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: getProportionateScreenWidth(20)),
                    Categories(),
                    SizedBox(height: getProportionateScreenWidth(40)),
                    HelpCard(),
                    // CameraScreen()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

