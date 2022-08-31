import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/error_indicator.dart';
import 'package:restaurant_app/widgets/null_indicator.dart';
import 'package:restaurant_app/widgets/restaurant_list_tile.dart';

class ConsumerSaved extends StatelessWidget {
  const ConsumerSaved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, state, child) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: state.saved.length,
            itemBuilder: (context, index) {
              var restaurant = state.saved[index];
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
            nullmessage: 'Tidak terdapat data yang disimpan',
          );
        } else {
          return const Material(child: Text(''));
        }
      },
    );
  }
}
