import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/review_provider.dart';

class ConsumerReview extends StatelessWidget {
  const ConsumerReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${state.state} menambah review',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
          Navigator.pop(context);
          return const Material(child: Text(''));
        }
      },
    );
  }
}
