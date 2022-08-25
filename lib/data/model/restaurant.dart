import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String rating;
  final Map menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> article) => Restaurant(
        id: article['id'],
        name: article['name'],
        description: article['description'],
        pictureId: article['pictureId'],
        city: article['city'],
        rating: article['rating'],
        menu: article['menu'],
      );
}

List<Restaurant> parseArticles(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
