import 'dart:convert';

import 'package:cubiiit/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  getProductData() async {
    var url = Uri.https("fakestoreapi.com", "products");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final list = jsonDecode(response.body);

      return list
          .map<ProductModel>((item) => ProductModel.fromMap(item))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
