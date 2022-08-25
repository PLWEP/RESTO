import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GeeksForGeeks")),
      body: const Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
