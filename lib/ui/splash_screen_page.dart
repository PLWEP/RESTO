import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/home_page.dart';

class SplashScreenPage extends StatelessWidget {
  static const routeName = '/splash_screen_page';

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/img/logo.png'),
      title: Text("RESTO", style: Theme.of(context).textTheme.headline1),
      backgroundColor: Colors.orangeAccent.shade200,
      navigator: const HomePage(),
      durationInSeconds: 5,
      showLoader: false,
    );
  }
}
