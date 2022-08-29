import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 100),
        Text(
          'Oops! Error Detected, Please contact related staff for further information',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
