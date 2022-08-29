import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/detail_page.dart';

class RestaurantListTile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListTile({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: Image.network(
            'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
            width: 100,
          ),
        ),
        title: Text(
          restaurant.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          restaurant.city,
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: Column(
          children: [
            const Icon(Icons.star_border),
            Text(
              restaurant.rating.toString(),
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: restaurant.id);
        },
      ),
    );
  }
}
