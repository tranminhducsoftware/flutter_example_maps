import 'package:maps/modules/maps/models/areas.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:io';

abstract class AreasRepo {
  Future<List<Areas>> getAreasList();
}

class AreasServices implements AreasRepo {
  //
  static const _baseUrl = 'https://localhost:44350';
  static const String _GET_AREAS = '/api/Areas';

  @override
  Future<List<Areas>> getAreasList() async {
    // Uri uri = Uri.https(_baseUrl, _GET_AREAS);
    // Response response = await http.get(uri);
    final url = Uri.parse('https://localhost:44350/api/Areas');
    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});
    // final response = await http.get(
    //   Uri.parse('https://localhost:44350/api/Areas'),
    //   headers: {"Content-Type": "application/json; charset=utf-8"},
    // );
    List<Areas> areas = areaFromJson(response.body);
    return areas;
  }
}
