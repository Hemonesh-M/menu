import 'package:flutter/material.dart';

class RecommendationModel {
  String name;
  String icon;
  String level;
  String duration;
  String cal;
  Color boxcolor;

  RecommendationModel(
      {required this.name,
      required this.icon,
      required this.boxcolor,
      required this.cal,
      required this.duration,
      required this.level});

  static List<RecommendationModel> getrecommendations() {
    List<RecommendationModel> recommendations = [];
    recommendations.add(
      RecommendationModel(
          name: 'Honey Pancakes',
          icon: 'assets/icons/honey-pancakes.svg',
          level: 'Easy',
          duration: '30 min',
          cal: '180k Cal',
          boxcolor: const Color.fromARGB(115, 177, 33, 31)),
    );
    recommendations.add(
      RecommendationModel(
          name: 'Blueberry Pancake',
          icon: 'assets/icons/blueberry-pancake.svg',
          level: 'Easy',
          duration: '20 min',
          cal: '200k Cal',
          boxcolor: const Color.fromARGB(115, 28, 6, 138)),
    );
    recommendations.add(
      RecommendationModel(
          name: 'Salmon Nigiri',
          icon: 'assets/icons/salmon-nigiri.svg',
          level: 'Hard',
          duration: '10 min',
          cal: '190k Cal',
          boxcolor: const Color.fromARGB(115, 177, 33, 31)),
    );
    recommendations.add(
      RecommendationModel(
          name: 'Canai Bread',
          icon: 'assets/icons/canai-bread.svg',
          level: 'Med',
          duration: '30 min',
          cal: '180k Cal',
          boxcolor: const Color.fromARGB(115, 28, 6, 138)),
    );
    return recommendations;
  }
}
