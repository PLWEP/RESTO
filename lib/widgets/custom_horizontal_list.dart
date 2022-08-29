import 'package:flutter/material.dart';

class CustomHorizontalList extends StatelessWidget {
  const CustomHorizontalList({
    Key? key,
    required this.item,
  }) : super(key: key);

  final List item;

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
