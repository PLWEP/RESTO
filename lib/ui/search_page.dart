import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import 'package:restaurant_app/widgets/consumer_search_restaurant.dart';
import 'package:restaurant_app/widgets/search_appbar.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search_page';

  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchRestaurantProvider>(
        create: (_) => SearchRestaurantProvider(apiService: ApiService()),
        child: const SearchAppbar(body: ConsumerSearchRestaurant()));
  }
}
