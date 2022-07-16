import 'package:flutter/material.dart';

import 'coffee_routes.dart';

class CoffeeRouterNotifier with ChangeNotifier {
  CoffeeRoutes _selectRoute = CoffeeRoutes.list();

  CoffeeRoutes get coffeeRoute => _selectRoute;

  set coffeeRoute(CoffeeRoutes value){
    print(value.id);
    _selectRoute = value;
    notifyListeners();
  }
}