import 'package:flutter/cupertino.dart';
import 'package:ttp_maps/src/constants/app_constants.dart';
import 'package:ttp_maps/src/widgets/info_card.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:
      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Wrap(
        runSpacing: 20,
        spacing: 20,
        children: <Widget>[
          InfoCard(
            title: "Confirmed Cases",
            iconColor: Color(0xFFFF8C00),
            effectedNum: 1062,
            press: () {},
          ),
          InfoCard(
            title: "Total Deaths",
            iconColor: Color(0xFFFF2D55),
            effectedNum: 75,
            press: () {},
          ),
          InfoCard(
            title: "Total Recovered",
            iconColor: Color(0xFF50E3C2),
            effectedNum: 689,
            press: () {},
          ),
          InfoCard(
            title: "New Cases",
            iconColor: Color(0xFF5856D6),
            effectedNum: 75,
            press: () {
            },
          ),
        ],
      ),
    );
  }
}