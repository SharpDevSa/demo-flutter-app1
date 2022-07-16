import 'package:coffe_app/app/coffe_list/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../coffee_router_notifier.dart';
import '../../coffee_routes.dart';

class CoffeeListPage extends StatelessWidget {
  CoffeeListPage({Key? key}) : super(key: key);
  final List<Coffee> coffeeList = [
    Coffee('0', 'Cold coffee', 'Description0'),
    Coffee('1', 'Latte', 'Description1'),
    Coffee('2', 'Americano', 'Description2'),
    Coffee('3', 'Espresso', 'Description3')
  ];


  @override
  Widget build(BuildContext context) {
    var router = Provider.of<CoffeeRouterNotifier>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.watch<CoffeeRouterNotifier>().coffeeRoute.id ?? 'Select your coffee',
        ),
      ),
      body:
          ListView(
            children: [
              for (var coffee in coffeeList)
                ListTile(
                    title: Text(coffee.name),
                    subtitle: Text(coffee.id),
                    onTap: () => {
                      context.read<CoffeeRouterNotifier>().coffeeRoute = CoffeeRoutes.details(coffee.id)
                    }
                )
            ],
          ),

    );
  }
}