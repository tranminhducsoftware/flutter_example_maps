import 'dart:convert';

List<Areas> areaFromJson(String str) =>
    List<Areas>.from(json.decode(str).map((x) => Areas.fromJson(x)));

String areaToJson(List<Areas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Areas {
  final String nAme;
  final int id;
  final String locations;
  final String description;
  final String attachName;
  final String attachUrl;

  Areas({
    required this.nAme,
    required this.id,
    required this.locations,
    required this.description,
    required this.attachName,
    required this.attachUrl,
  });

  factory Areas.fromJson(Map<String, dynamic> json) {
    return Areas(
      nAme: json['nAme'],
      id: json['id'],
      locations: json['locations'],
      description: json['description'],
      attachName: json['attachName'],
      attachUrl: json['attachUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        "nAme": nAme,
        "id": id,
        "locations": locations,
        "description": description,
        "attachName": attachName,
        "attachUrl": attachUrl,
      };
}
