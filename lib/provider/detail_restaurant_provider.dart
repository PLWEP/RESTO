import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailRestaurantProvider({required this.id, required this.apiService}) {
    _fetchAllDetailRestaurant();
  }

  late DetailRestaurantResult _detailrestaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailRestaurantResult get result => _detailrestaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllDetailRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detailrestaurant = await apiService.detailRestaurant(id);
      if (detailrestaurant.error == true) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailrestaurantResult = detailrestaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
