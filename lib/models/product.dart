import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      this.price,
      this.imageUrl,
      this.isFavorite});

  void toggleFavorite (bool isFavoriteInput ){
     String fav = isFavoriteInput == null ? 'null' : isFavoriteInput.toString();
    print('isFavorite toggled ' + fav);
    /*isFavoriteInput == null ? true : isFavorite = isFavoriteInput ; */
    isFavorite = isFavoriteInput;
    print (isFavorite);
    notifyListeners();
  }
}
