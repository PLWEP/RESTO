import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errormessage;

  const ErrorPage({Key? key, required this.errormessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 100),
        Text(
          errormessage,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
