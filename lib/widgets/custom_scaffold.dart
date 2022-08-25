import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          body,
          _buildCustomAppBar(context),
        ],
      )),
    );
  }
}

Card _buildCustomAppBar(BuildContext context) {
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
      ),
    ),
    color: Colors.orange.shade200,
    margin: const EdgeInsets.all(0),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "RESTO",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Recommendation restaurant for you!',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}