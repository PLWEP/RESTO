import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/review.dart';
import 'package:restaurant_app/data/model/search_restaurant.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _list = 'list';
  static const String _detail = 'detail';
  static const String _search = 'search?q=';
  static const String _review = 'review';

  Future<RestaurantResult> listRestaurant() async {
    final response = await http.get(Uri.parse("$_baseUrl$_list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<DetailRestaurantResult> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl$_detail/$id"));
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<SearchRestaurantResult> searchRestaurant(String name) async {
    final response = await http.get(Uri.parse("$_baseUrl$_search$name"));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ReviewResult> addReview(Map<dynamic, dynamic> data) async {
    final response =
        await http.post(Uri.parse("$_baseUrl$_review"), body: data);
    if (response.statusCode == 200) {
      return ReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post data');
    }
  }
}
