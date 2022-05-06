/// This is the repository file for settings that allow the user to
/// view their movie list in ascending or descending order.
///
/// [SharedPreferences] is used for persistence so that the app
/// remembers which setting was selected.

import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

const String isAscending = "isAscending";

class SettingsRepository {
  Future<void> setIsAscending(bool value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(isAscending, value);
  }

  Future<bool?> getIsAscending() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(isAscending);
  }
}
