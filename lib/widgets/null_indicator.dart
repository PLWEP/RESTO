import 'package:flutter/material.dart';

class NullIndicator extends StatelessWidget {
  final String nullmessage;

  const NullIndicator({Key? key, required this.nullmessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.search_off, size: 75),
        Text(
          nullmessage,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
