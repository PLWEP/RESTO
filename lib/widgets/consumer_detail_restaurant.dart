import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/widgets/error_indicator.dart';
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
      } else if (state.state == ResultState.error ||
          state.state == ResultState.noData) {
        if (state.message.contains('Failed host lookup')) {
          return const ErrorIndicator(
            errormessage: 'Tidak dapat tersambung dengan internet',
          );
        }

        return const ErrorIndicator(
          errormessage: 'Data tidak ditemukan',
        );
      } else {
        return const Material(child: Text(''));
      }
    });
  }
}
