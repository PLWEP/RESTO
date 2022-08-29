import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/widgets/detail_item.dart';
import 'package:restaurant_app/widgets/error_page.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';

  final String id;

  const RestaurantDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  late Future<DetailRestaurantResult> _detailrestaurant;

  @override
  void initState() {
    super.initState();
    _detailrestaurant = ApiService().detailRestaurant(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _detailrestaurant,
      builder: (context, AsyncSnapshot<DetailRestaurantResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            var restaurant = snapshot.data?.restaurant;
            return DetailItem(restaurant: restaurant!);
          } else if (snapshot.hasError) {
            return const ErrorPage();
          } else {
            return const Material(child: Text(''));
          }
        }
      },
    );
  }
}
