import 'package:coffe_app/coffee_router_delegate.dart';
import 'package:coffe_app/coffee_router_parser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'coffee_router_notifier.dart';

class MyCoffeeApp extends StatefulWidget{
  const MyCoffeeApp({Key? key}) : super(key: key);

  @override
  _MyCoffeeAppState createState() => _MyCoffeeAppState();

}

class _MyCoffeeAppState extends State<MyCoffeeApp> {
  final CoffeeRouterDelegate _routerDelegate = CoffeeRouterDelegate();
  final CoffeeRouterParser _routerParser = CoffeeRouterParser();


  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoffeeRouterNotifier())
      ],
      child: MaterialApp.router(
          routeInformationParser: _routerParser,
          routerDelegate: _routerDelegate
      )
    );
  }
}