import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/widgets/custom_horizontal_list.dart';
import 'package:restaurant_app/widgets/review_list_tile.dart';

class DetailRestaurantView extends StatelessWidget {
  final DetailRestaurant restaurant;

  const DetailRestaurantView({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}')),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.place_outlined),
                          const SizedBox(width: 5),
                          Text(
                            restaurant.city,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          const Icon(Icons.star_border),
                          const SizedBox(width: 5),
                          Text(
                            restaurant.rating.toString(),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  CustomHorizontalList(item: restaurant.categories),
                  const SizedBox(height: 20),
                  Text('About', style: Theme.of(context).textTheme.headline3),
                  const Divider(color: Colors.grey),
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Menu',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.justify,
                  ),
                  const Divider(color: Colors.grey),
                  CustomHorizontalList(item: restaurant.menus.drinks),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomHorizontalList(item: restaurant.menus.foods),
                  const SizedBox(height: 20),
                  Text(
                    'Review',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.justify,
                  ),
                  const Divider(color: Colors.grey),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurant.customerReviews.length,
                      itemBuilder: (BuildContext context, int index) {
                        var review = restaurant.customerReviews[index];
                        return ReviewListTile(review: review);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
