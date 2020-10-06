import 'dart:convert';

import '../model.dart';
import 'package:http/http.dart' as http;

class getInfoApi {
  Future<model> getData() async {
    final response = await http.get(
        'https://zeropoint.biancojo.com/api/products/18?with=market;category;options;optionGroups;productReviews;productReviews.user');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return model.fromJson(json.decode(response.body));
    }
  }
}
