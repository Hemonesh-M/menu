import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String icon;
  Color boxcolor;
  CategoryModel(
      {required this.name, required this.icon, required this.boxcolor});
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(
      CategoryModel(
          name: 'Salad',
          icon: 'assets/icons/plate.svg',
          boxcolor: const Color.fromARGB(115, 177, 33, 31)),
    );
    categories.add(
      CategoryModel(
          name: 'Pie',
          icon: 'assets/icons/pie.svg',
          boxcolor: const Color.fromARGB(115, 28, 6, 138)),
    );
    categories.add(
      CategoryModel(
          name: 'Fruits',
          icon: 'assets/icons/orange-snacks.svg',
          boxcolor: const Color.fromARGB(115, 177, 41, 31)),
    );
    categories.add(
      CategoryModel(
          name: 'Canai Bread',
          icon: 'assets/icons/canai-bread.svg',
          boxcolor: const Color.fromARGB(115, 28, 6, 138)),
    );
    return categories;
  }
}
