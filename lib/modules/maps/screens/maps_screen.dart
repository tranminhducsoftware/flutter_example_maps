/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 *
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps/modules/maps/bloc/maps_bloc.dart';
import 'package:maps/modules/maps/models/areas.dart';
import 'package:maps/widgets/error.dart';
import 'package:maps/widgets/list_row.dart';
import 'package:maps/widgets/loading.dart';
import 'package:maps/modules/maps/bloc/maps_events.dart';
import 'package:maps/modules/maps/bloc/maps_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MapsPage extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsPage> {
  //
  @override
  void initState() {
    super.initState();
    _loadAreas();
  }
  _loadAreas() async {
    context.read<AreasBloc>().add(AreasEvents.fetchAreas);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }
  _body() {
    return Column(
      children: [
        BlocBuilder<AreasBloc, AreasState>(
            builder: (BuildContext context, AreasState state) {
              if (state is AreasListError) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry.';
                return ErrorTxt(
                  message: message,
                  onTap: _loadAreas,
                );
              }
              if (state is AreasLoaded) {
                List<Areas> areas = state.areas;
                return _list(areas);
              }
              return Loading();
            }),
      ],
    );
  }

  Widget _list(List<Areas> areas) {
    return Expanded(
      child: ListView.builder(
        itemCount: areas.length,
        itemBuilder: (_, index) {
          Areas area = areas[index];
          return ListRow(areas: area);
        },
      ),
    );
  }
}
