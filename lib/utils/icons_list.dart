import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  final List<Map<String, dynamic>> homeExpensesCategories = [
    {
      "name": "Gas Filling ",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Grocery ",
      "icon": FontAwesomeIcons.shoppingCart,
    },
    {
      "name": "Milk ",
      "icon": FontAwesomeIcons.mugHot,
    },
    {
      "name": "Intenet ",
      "icon": FontAwesomeIcons.wifi,
    },
    {
      "name": "Electricity ",
      "icon": FontAwesomeIcons.bolt,
    },
    {
      "name": "water ",
      "icon": FontAwesomeIcons.water,
    },
    {
      "name": "Rent ",
      "icon": FontAwesomeIcons.home,
    },
    {
      "name": "Phone Bill ",
      "icon": FontAwesomeIcons.phone,
    },
    {
      "name": "Dinning Out ",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Entertainment ",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Healthcare ",
      "icon": FontAwesomeIcons.medkit,
    },
    {
      "name": "Transportation ",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "Clothing ",
      "icon": FontAwesomeIcons.tshirt,
    },
  ];

  IconData getExpenseCategoryIcons(String categoryName) {
    final category = homeExpensesCategories.firstWhere(
        (category) => category['name'] == categoryName,
        orElse: () => {"icon": FontAwesomeIcons.shoppingCart});
    return category['icon'];
  }
}
