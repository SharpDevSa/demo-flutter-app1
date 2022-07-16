import 'package:flutter/material.dart';
import 'coffee_routes.dart';

class CoffeeRouterParser extends  RouteInformationParser<CoffeeRoutes> {
  @override
  Future<CoffeeRoutes> parseRouteInformation(RouteInformation routeInformation) async {
    // TODO: implement parseRouteInformation
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return CoffeeRoutes.list();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      return CoffeeRoutes.details(first);
    } else {
      return CoffeeRoutes.unknown();
    }
  }


  @override
  RouteInformation restoreRouteInformation(CoffeeRoutes configuration) {
    if (configuration.selectedPage == CoffeePage.details && configuration.id != null) {
      return RouteInformation(location: '/details/${configuration.id}');
    } else if (configuration.selectedPage == CoffeePage.list) {
      return const RouteInformation(location: '/list');
    } else {
      return const RouteInformation(location: '/unknown');
    }
  }

}