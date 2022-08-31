import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getSaved();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Restaurant> _saved = [];
  List<Restaurant> get saved => _saved;

  void _getSaved() async {
    _state = ResultState.loading;
    _saved = await databaseHelper.getSaved();
    if (_saved.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addSaved(Restaurant restaurant) async {
    try {
      await databaseHelper.insertSaved(restaurant);
      _getSaved();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isSaved(String id) async {
    final bookmarkedArticle = await databaseHelper.getSavedbyId(id);
    return bookmarkedArticle.isNotEmpty;
  }

  void removeSaved(String id) async {
    try {
      await databaseHelper.removeSaved(id);
      _getSaved();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
