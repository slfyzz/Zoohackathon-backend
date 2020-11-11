import 'package:http/http.dart' as http;
import 'package:nature_finder/utilites/animal_data.dart';
import 'dart:convert' as convert;

import 'package:nature_finder/utilites/full_animal_data.dart';

class AnimalsAPI {
  Future<List<AnimalData>> getData(String country) async {
    http.Response jsonData = await http
        .get("https://serene-sea-95236.herokuapp.com/$country/animals");
    if (jsonData.statusCode == 200) {
      List<dynamic> content = convert.jsonDecode(jsonData.body);

      List<AnimalData> data = [];
      for (Map m in content) {
        data.add(AnimalData(
            m['name'], m['Species'], m['extinct'], m['profileImage']));
      }
      return data;
    } else {
      throw Exception("error ${jsonData.statusCode} in getting data");
    }
  }

  Future<FullAnimalData> getFullAnimalData(String animalName) async {
    http.Response jsonData = await http.get("https://serene-sea-95236.herokuapp.com/animals/$animalName");
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
          content["extinct"],);
    } else {
      throw Exception("error ${jsonData.statusCode} in getting data");
    }
    return data;
  }
}
