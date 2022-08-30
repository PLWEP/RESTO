import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/search_page.dart';

class CustomAppbar extends StatelessWidget {
  final Widget body;

  const CustomAppbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _buildCustomAppBar(context),
          Expanded(
            child: body,
          ),
        ],
      )),
    );
  }
}

Card _buildCustomAppBar(BuildContext context) {
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(16.0),
      ),
    ),
    color: Colors.orangeAccent.shade200,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "RESTO",
                style: Theme.of(context).textTheme.headline1,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchPage.routeName);
                },
                icon: const Icon(Icons.search),
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
