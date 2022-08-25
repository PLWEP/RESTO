import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/home_page.dart';
import 'package:restaurant_app/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
              onPrimary: Colors.black,
            ),
        textTheme: appTextTheme,
      ),
      initialRoute: SplashScreenPage.routeName,
      routes: {
        SplashScreenPage.routeName: (context) => const SplashScreenPage(),
        HomePage.routeName: (context) => const HomePage(),
        // RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(
        //       restaurant:
        //           ModalRoute().of(context)?.settings.arguments as Restaurant,
        //     ),
      },
    );
  }
}
