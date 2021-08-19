import 'package:flutter/material.dart';
import 'package:maps/modules/maps/models/areas.dart';
import 'package:maps/widgets/txt.dart';


class ListRow extends StatelessWidget {
  //
  final Areas areas;
  ListRow({required this.areas});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: areas.nAme),
          Divider(),
        ],
      ),
    );
  }
}
