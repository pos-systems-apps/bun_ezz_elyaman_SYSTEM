import 'package:flutter/material.dart';

class ButtonNavigationItems {
  List<Item> items;

  ButtonNavigationItems({required this.items});
}

class Item {
  Widget image;
  String title;
  TextStyle titleTextStyle;

  Item(
      {required this.image, required this.title, required this.titleTextStyle});
}
