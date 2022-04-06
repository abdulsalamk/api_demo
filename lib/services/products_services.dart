import 'package:api_demo/models/products.dart';

import 'package:http/http.dart' as http;

class ProductsService {
  Future<List<Product>?> getProducts() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://pxqiw9agqi.execute-api.eu-west-2.amazonaws.com/staging/products');

    var response = await client.get(uri);
    var json = '';
    if (response.statusCode == 200) {
      json = response.body;
    }
    return productFromJson(json);
  }
}
