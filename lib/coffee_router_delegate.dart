import 'package:coffe_app/app/coffe_details/coffee_details_page.dart';
import 'package:coffe_app/coffee_router_notifier.dart';
import 'package:coffe_app/coffee_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/coffe_list/coffe_list_page.dart';
import 'app/coffe_list/coffee.dart';

class CoffeeRouterDelegate extends RouterDelegate<CoffeeRoutes> with ChangeNotifier,
    PopNavigatorRouterDelegateMixin<CoffeeRoutes>{

  final GlobalKey<NavigatorState> _navigatorKey;
  CoffeePage _selectedPage = CoffeePage.list;

  CoffeeRouterDelegate(): _navigatorKey = GlobalKey<NavigatorState>();

  @override
  CoffeeRoutes get currentConfiguration {
    return CoffeeRoutes.list();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navigatorKey,
        pages: [
          MaterialPage(
              key: const ValueKey("CoffeeList"),
              child: CoffeeListPage()),
          if (_selectedPage == CoffeePage.details)
            MaterialPage(
                key: const ValueKey("CoffeeDetails"),
                child: CoffeeDetailsPage(Coffee("0", 'name', 'description'))
            )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          _selectedPage = CoffeePage.list;
          notifyListeners();
          return true;
        }
    );
  }

  @override
  Future<void> setNewRoutePath(CoffeeRoutes configuration) async {
    print("set new path" + configuration.selectedPage.toString());
    _selectedPage = configuration.selectedPage;
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

}