import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;
  bool _isDailyNotificationActive = false;
  bool get isDailyNotificationActive => _isDailyNotificationActive;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyNotificationPreferences();
  }

  void _getDailyNotificationPreferences() async {
    _isDailyNotificationActive =
        await preferencesHelper.isDailyNotificationActive;
    notifyListeners();
  }

  void enableDailyNotification(bool value) {
    preferencesHelper.setDailyNotification(value);
    _getDailyNotificationPreferences();
  }
}
