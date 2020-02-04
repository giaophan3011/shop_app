import 'package:flutter/material.dart';
import 'package:shop_app/appState.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './app_routes.dart';
import 'package:provider/provider.dart';
import './provider/products.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './actions/actions.dart' ;

void main() {
  runApp(MyApp());
}

AppState productListReducer (AppState state, DisplayListOnlyAction actions) {
  state.addProduct();
  return state;
}

AppState cartReducer (AppState state, AddItemToCart actions) {
  state.addItem(actions.item);
  return state;
}


class MyApp extends StatelessWidget {
 /*  final Store<int> store = Store<int>(
    counterReducer,
    initialState: 0,
    //middleware: createStoreMiddleware(),
  ); */
  static final appConnectivityReducer = combineReducers<AppState>([
    TypedReducer<AppState,DisplayListOnlyAction>(productListReducer),
    TypedReducer<AppState,AddItemToCart>(cartReducer),
  ]);

  final Store<AppState> store = Store<AppState> (
    appConnectivityReducer,
    initialState: AppState(),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'My Shop',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepOrange,
          ),
          home: ChangeNotifierProvider(
            builder: (context) => Products(),
            child: ProductsOverviewScreen(),
          ),
          routes: {
            //AppRoutes.home_screen: (context) => ProductsOverviewScreen(),
            AppRoutes.product_detail_screen: (context) => ProductDetailScreen(),
            AppRoutes.cart_screen: (context) => CartScreen(),
          }),
    );
  }
}
