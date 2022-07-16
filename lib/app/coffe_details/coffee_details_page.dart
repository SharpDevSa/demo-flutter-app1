

import 'package:coffe_app/app/coffe_list/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeDetailsPage extends StatelessWidget {
  final Coffee _selectedCoffee;

  const CoffeeDetailsPage(this._selectedCoffee, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(_selectedCoffee.name),
          Text(_selectedCoffee.description),
        ],
      ),
    );
  }

}