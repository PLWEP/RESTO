import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/error_page.dart';
import 'package:restaurant_app/widgets/list_item.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late Future<RestaurantResult> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().listRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _restaurant,
      builder: (context, AsyncSnapshot<RestaurantResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = snapshot.data?.restaurants[index];
                return ListItem(restaurant: restaurant!);
              },
            );
          } else if (snapshot.hasError) {
            return const ErrorPage();
          } else {
            return const Material(child: Text(''));
          }
        }
      },
    );
  }
}
