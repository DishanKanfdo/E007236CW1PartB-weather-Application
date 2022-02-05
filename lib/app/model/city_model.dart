import 'dart:convert';

import 'package:flutter_riverpod/all.dart';
import 'package:open_weather_app/app/services/service.dart';
// CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));
//
// String cityModelToJson(CityModel data) => json.encode(data.toJson());
//
// class CityModel {
//   CityModel({
//     required this.list,
//   });
//
//   List<ListElement> list;
//
//   factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
//     list: List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "List": List<dynamic>.from(list.map((x) => x.toJson())),
//   };
// }
//
// class ListElement {
//   ListElement({
//     required this.id,
//     required this.name,
//     required this.state,
//     required this.country,
//   });
//
//   String id;
//   String name;
//   String state;
//   String country;
//
//   factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
//         id: json["id"],
//         name: json["name"],
//         state: json["state"],
//         country: json["country"],
//       );
//
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "state": state,
//         "country": country,
//       };
// }
// List<CityModel> cityModelFromJson(String str) =>
//     List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

// String cityModelToJson(List<CityModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel{
  int id;
  String name;
  String state;
  String country;

  CityModel({
    required this.id,
    required this.name,
    required this.state,
    required this.country,
  });

  // factory CityModel.fromMap(Map<String, dynamic> map) {
  //   print("map          map           map");
  //   print(map["id"]);
  //
  //   return CityModel(
  //     id: map["id"],
  //     name: map["name"],
  //     state: map["state"],
  //     country: map["country"],
  //   );
  // }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "name": name,
  //     "state": state,
  //     "country": country,
  //   };
  // }


// factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
//   id: json["id"],
//   name: json["name"],
//   state: json["state"],
//   country: json["country"],
// );
//
//
// Map<String, dynamic> toJson() => {
//   "id": id,
//   "name": name,
//   "state": state,
//   "country": country,
// };
}
