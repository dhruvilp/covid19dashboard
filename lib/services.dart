import 'dart:async';
import 'dart:convert';

import 'package:coronavirus_dashboard/models/models.dart';
import 'package:http/http.dart' as http;

import 'defaults.dart';

final client = new http.Client();
final kHeader = {"Content-Type": "application/json"};

///========================================================
///                     HTTP Requests
///========================================================

Future<http.Response> getRequest(String endPoint) {
  return client.get(BASE_URL + endPoint, headers: kHeader)
      .timeout(const Duration(seconds: 30));
}

///=======================================================

Future<GlobalData> fetchGlobalData() async {
  var response = await getRequest("/all");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return GlobalData.fromJson(data);
  } else {
    print("Error code: ${response.statusCode}\nResponse msg: ${response.body}");
    throw SomethingWentWrong();
  }
}

Future<List<CountryData>> fetchCountryData() async {
  var response = await getRequest("/countries?sort=cases");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data
        .map<CountryData>((resource) => new CountryData.fromJson(resource))
        .toList();
  } else {
    print("Error code: ${response.statusCode}\nResponse msg: ${response.body}");
    throw SomethingWentWrong();
  }
}

Future<List<StateData>> fetchStateData() async {
  var response = await getRequest("/states?sort=cases");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data
        .map<StateData>((resource) => new StateData.fromJson(resource))
        .toList();
  } else {
    print("Error code: ${response.statusCode}\nResponse msg: ${response.body}");
    throw SomethingWentWrong();
  }
}



///================= EXCEPTION(s) ==================

class SomethingWentWrong implements Exception {
  String errorMessage() => "Something went wrong!";
  String toString() => errorMessage();
}