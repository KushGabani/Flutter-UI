import 'package:demo_app/Screens/diet_recommendation.dart';
import 'package:demo_app/Screens/kegel_exercises.dart';
import 'package:demo_app/Screens/yoga.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/Screens/meditation.dart';

class Category {
  final String imagePath;
  final String categoryName;
  final StatelessWidget screen;

  Category(this.imagePath, this.categoryName, this.screen);
}

var rawData = [
  {
    "imagePath": "assets/icons/Hamburger.svg",
    "categoryName": "Diet Recommendations",
    "screen": DietRecommendation(),
  },
  {
    "imagePath": "assets/icons/Excrecises.svg",
    "categoryName": "Kegel Exercises",
    "screen": KegelExercises(),
  },
  {
    "imagePath": "assets/icons/Meditation.svg",
    "categoryName": "Meditation",
    "screen": Meditation(),
  },
  {
    "imagePath": "assets/icons/yoga.svg",
    "categoryName": "Yoga",
    "screen": Yoga(),
  },
];

var categoriesData = rawData
    .map((e) => Category(e["imagePath"], e["categoryName"], e["screen"]))
    .toList();
