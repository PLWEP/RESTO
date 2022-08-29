import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';

class ListDetailReview extends StatelessWidget {
  final CustomerReview review;

  const ListDetailReview({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: const Icon(Icons.people, size: 30),
        title: Text(
          review.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          '"${review.review}" \n${review.date}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        isThreeLine: true,
      ),
    );
  }
}
