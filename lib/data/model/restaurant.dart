import 'dart:convert';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant copyWith({
    required String id,
    required String name,
    required String description,
    required String pictureId,
    required String city,
    required double rating,
    required Menus menus,
  }) =>
      Restaurant(
        id: id,
        name: name,
        description: description,
        pictureId: pictureId,
        city: city,
        rating: rating,
        menus: menus,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  final List<Drink> foods;
  final List<Drink> drinks;

  Menus copyWith({
    required List<Drink> foods,
    required List<Drink> drinks,
  }) =>
      Menus(
        foods: foods,
        drinks: drinks,
      );

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );
}

class Drink {
  Drink({
    required this.name,
  });

  final String name;

  Drink copyWith({
    required String name,
  }) =>
      Drink(
        name: name,
      );

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
      );
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final Map parsedJson = jsonDecode(json);
  List parsed = parsedJson['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
