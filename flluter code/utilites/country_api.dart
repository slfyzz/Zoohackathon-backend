import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'country_data.dart';

class CountryAPI {

  Future<List<CountryData>> getData() async {
    http.Response jsonData = await http.get(
        "https://serene-sea-95236.herokuapp.com/countries/all");
    if (jsonData.statusCode == 200) {
      List<dynamic> content = convert.jsonDecode(jsonData.body);

      List<CountryData> data = [];
      for(Map m in content){
        data.add(CountryData(m['countryName'], m['flagSrc']));
      }
      return data;
    } else {
      throw Exception("error ${jsonData.statusCode} in getting data");
    }
  }

}


