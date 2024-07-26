import 'dart:convert';

import 'package:api_get/models/api_models.dart';
import 'package:http/http.dart' as http;

ApiGetProduct() async {
  Uri url = Uri.parse(
      'https://mansharcart.com/api/products/category/139/key/123456789');

  var response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      var data = apiModelsFromJson(response.body);
      return data.products;
    } else {
      print("Error Occured");
    }
  } catch (e) {}
}
