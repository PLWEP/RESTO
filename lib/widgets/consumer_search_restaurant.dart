import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import 'package:restaurant_app/widgets/error_indicator.dart';
import 'package:restaurant_app/widgets/null_indicator.dart';
import 'package:restaurant_app/widgets/restaurant_list_tile.dart';

class ConsumerSearchRestaurant extends StatelessWidget {
  const ConsumerSearchRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRestaurantProvider>(
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
            return const ErrorIndicator(
              errormessage: 'Tidak dapat tersambung dengan internet',
            );
          }

          return const NullIndicator(
            nullmessage: 'Data tidak ditemukan\nCoba kata kunci lain',
          );
        } else {
          return const Material(child: Text(''));
        }
      },
    );
  }
}
