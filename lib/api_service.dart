import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'model.dart';






class ApiService {
  Future <List<Countries>?> getUsers() async {
    try {
      var url = Uri.parse('https://restcountries.com/v3.1/all');
      var response = await http.get(url);
      if (response.statusCode == 200) {
       // var model = countryModelToJson(response.body)    ;
        return countryModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;

  }
}


