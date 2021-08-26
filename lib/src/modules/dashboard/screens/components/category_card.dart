import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ttp_maps/src/constants/app_constants.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;

    const CategoryCard({
      Key key,
      this.svgSrc,
      this.title,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}