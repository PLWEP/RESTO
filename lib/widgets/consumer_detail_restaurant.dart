import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/widgets/detail_restaurant_view.dart';

class ConsumerDetailRestaurant extends StatelessWidget {
  const ConsumerDetailRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        var restaurant = state.result.restaurant;
        return DetailRestaurantView(restaurant: restaurant);
      } else if (state.state == ResultState.noData) {
        return Center(
          child: Material(
            child: Text(state.message),
          ),
        );
      } else {
        return const Material(child: Text(''));
      }
    });
  }
}
