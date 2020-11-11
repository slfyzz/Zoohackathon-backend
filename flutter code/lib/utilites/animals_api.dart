import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:nature_finder/utilites/full_animal_data.dart';

class AnimalsAPI {
  Future<List<FullAnimalData>> getAllAnimalsInCountry(String country) async {
    http.Response jsonData = await http
        .get("https://serene-sea-95236.herokuapp.com/$country/animals");
    if (jsonData.statusCode == 200) {
      List<dynamic> list = convert.jsonDecode(jsonData.body);

      List<FullAnimalData> data = [];
      for (Map content in list) {
        data.add(
          FullAnimalData(
            content["name"],
            content["Species"],
            content["Description"],
            content["Environment"],
            content["WhatItEats"],
            content["ageRange"],
            content["Use"],
            content["conservationStatus"],
            content["Countries"],
            content["profileImage"],
            content["coverImage"],
            content["extinct"],
          ),
        );
      }
      return data;
    } else {
      throw Exception("error ${jsonData.statusCode} in getting data");
    }
  }
  Future<FullAnimalData> getFullAnimalData(String animalName) async {
    http.Response jsonData = await http
        .get("https://serene-sea-95236.herokuapp.com/animals/$animalName");
    FullAnimalData data;
    if (jsonData.statusCode == 200) {
      var content = convert.jsonDecode(jsonData.body);
      data = FullAnimalData(
        content["name"],
        content["Species"],
        content["Description"],
        content["Environment"],
        content["WhatItEats"],
        content["ageRange"],
        content["Use"],
        content["conservationStatus"],
         content["Countries"],
        content["profileImage"],
        content["coverImage"],
        content["extinct"],
      );
    } else {
      throw Exception("error ${jsonData.statusCode} in getting data");
    }
    return data;
  }
}
