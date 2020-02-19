import 'package:redux/redux.dart';

import '../actions/actions.dart' as actions;
import '../appState.dart';
import '../services/api_services.dart';


List<Middleware<AppState>> createStoreMiddlewares () {
  return [
    TypedMiddleware<AppState, actions.AddItemToCart>(_postItemToFirebase())
  ];
}

_postItemToFirebase () => (Store<AppState> store, actions.AddItemToCart action, NextDispatcher next){
  print('does it go thru middleware ' + action.item.id);
 // postProduct(action.item);
  /* try {
    //post sth
  }
  catch (err){
    //so sth
  }
   */
  next(action);

};