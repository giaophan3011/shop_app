import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/cart_item.dart';
import '../appState.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: StoreConnector<AppState, _CartScreenModel>(
        converter: (store) => _CartScreenModel().fromStore(store),
        builder: (context, viewModel) {
          List<Product> productAddedToCart = viewModel.listOfProducts;
          return Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Text("Total"),
                    SizedBox(width: 10),
                    Chip(
                        label: Text(
                      viewModel.amountPrice.toString(),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productAddedToCart.length,
                  itemBuilder: (context, index) {
                    return CartItem(productAddedToCart[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartScreenModel {
  double amountPrice;
  List<Product> listOfProducts;
  _CartScreenModel();

  _CartScreenModel fromStore(Store<AppState> store) {
    this.amountPrice = store.state.totalAmountInPrice;
    this.listOfProducts = store.state.cartItems;
    return this;
  }
}
