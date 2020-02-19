import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:shop_app/appState.dart';
import 'package:shop_app/screens/add_product_screen.dart';
import 'package:shop_app/screens/choose_organization_screen.dart';

import './actions/actions.dart' ;
import './app_routes.dart';
import './middlewares/api_middleware.dart';
import './provider/products.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';


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
    middleware: createStoreMiddlewares(),
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
            child: ChooseOrganizationScreen(),
            //child: ProductsOverviewScreen(),
          ),
          routes: {
            //AppRoutes.home_screen: (context) => ProductsOverviewScreen(),
            AppRoutes.product_detail_screen: (context) => ProductDetailScreen(),
            AppRoutes.cart_screen: (context) => CartScreen(),
            AppRoutes.add_product_screen: (context) => AddProductScreen(),
          }),
    );
  }
}
