import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_app/appState.dart';

import '../actions/actions.dart' as actions;
import '../models/product.dart';
import '../services/api_services.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  Product _newProduct = Product(
      id: DateTime.now().toString(), title: '', price: 0.0, description: '');

  Future<void> _saveForm(Function addItemToCart) {
    _formKey.currentState.save();
    print(_newProduct.price);
    setState(() {
      print(1);
      _isLoading = true;
    });

    return postProduct(_newProduct).then((_) {
      addItemToCart();
    }).catchError((err) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error occured!'),
          content: Text(err.toString()),
          actions: <Widget>[
            FlatButton(
              child: Text('OK!'),
              onPressed: () {
                print('st wrong');
                setState(() {
                  print(1);
                  _isLoading = false;
                });
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }).then((_) {
      setState(() {
        print(1);
        _isLoading = false;
      });
      Navigator.of(context).pop();
    });
  }

  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    print('build form');
    // Build a Form widget using the _formKey created above.
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Title"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newProduct = Product(
                      id: _newProduct.id,
                      title: value,
                      price: _newProduct.price,
                      description: _newProduct.description,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Price"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    try {
                      double inputPrice = double.parse(value);
                      _newProduct = Product(
                        id: _newProduct.id,
                        title: _newProduct.title,
                        price: inputPrice,
                        description: _newProduct.description,
                      );
                    } catch (err) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(value + ' is not a valid double'),
                      ));
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Description"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _newProduct = Product(
                      id: _newProduct.id,
                      title: _newProduct.title,
                      price: _newProduct.price,
                      description: value,
                    );
                  },
                ),
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    // Return a `VoidCallback`, which is a fancy name for a function
                    // with no parameters. It only dispatches an Increment action.
                    return () =>
                        store.dispatch(actions.AddItemToCart(_newProduct));
                  },
                  builder: (context, addItemToCart) {
                    return new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            print(_formKey.currentState);

                            _saveForm(addItemToCart);

                            //addItemToCart();
                            // If the form is valid, display a Snackbar.

                          }
                        },
                        child: Text('Submit'),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
