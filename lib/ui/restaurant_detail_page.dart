import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
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
                child: Image.network(restaurant.pictureId)),
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
                  _BuildMenuItems(item: restaurant.menus.drinks),
                  const SizedBox(
                    height: 5,
                  ),
                  _BuildMenuItems(item: restaurant.menus.foods),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildMenuItems extends StatelessWidget {
  const _BuildMenuItems({
    Key? key,
    required this.item,
  }) : super(key: key);

  final List<Drink> item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            color: Colors.orangeAccent.shade200,
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 7.0,
              ),
              child: Text(
                item[index].name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          );
        },
      ),
    );
  }
}
