import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/widgets/consumer_detail_restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
        create: (_) =>
            DetailRestaurantProvider(apiService: ApiService(), id: id),
        child: const ConsumerDetailRestaurant());
  }
}
