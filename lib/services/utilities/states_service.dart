import 'dart:convert';

import 'package:covid_19/model/world_state.dart';
import 'package:covid_19/services/utilities/api_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldState> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldAPi));
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var responseData = jsonDecode(response.body);

      return WorldState.fromJson(responseData);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetchCounriesRecords() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countiresList));
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
     
      var responseData = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Error');
    }
  }
}
