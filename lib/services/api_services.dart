import 'package:http/http.dart' as http;
import 'package:shop_app/models/product.dart';
import 'dart:convert';

const url = "https://flutter-app-b7b31.firebaseio.com/products.json";

Future<void> postProduct(Product product) async {
  try {
    await http.post(
      url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'id': DateTime.now().toString(),
      }),
    );
    
  } catch (err) {
    throw err;
  }
  
}
