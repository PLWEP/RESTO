import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widgets/consumer_restaurant.dart';
import 'package:restaurant_app/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper())),
      ChangeNotifierProvider(
          create: (_) => RestaurantProvider(apiService: ApiService())),
    ], child: const CustomAppbar(body: ConsumerRestaurant()));
  }
}
