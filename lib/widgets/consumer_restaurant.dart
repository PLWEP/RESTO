import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/error_page.dart';
import 'package:restaurant_app/widgets/restaurant_list_tile.dart';

class ConsumerRestaurant extends StatelessWidget {
  const ConsumerRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return RestaurantListTile(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.error ||
            state.state == ResultState.noData) {
          if (state.message.contains('Failed host lookup')) {
            return const ErrorPage(
              errormessage: 'Tidak dapat tersambung dengan internet',
            );
          }

          return const ErrorPage(
            errormessage: 'Terjadi kesalah silahkan coba lagi',
          );
        } else {
          return const Material(child: Text(''));
        }
      },
    );
  }
}
