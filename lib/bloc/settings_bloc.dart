/// This is the bloc file for settings.
///
/// If the app is started for the first time, init() will
/// initialize the default value of of isAscending to false,
/// which means that movies will be sorted in descending order
/// (newest movies first) by default.

import 'package:rxdart/rxdart.dart';
import 'package:movie_app/repository/settings_repository.dart';

class SettingsBloc {
  static var _instance = SettingsBloc._internal();

  factory SettingsBloc() => _instance;

  static void reset() {
    _instance.dispose();
    _instance = SettingsBloc._internal();
  }

  SettingsBloc._internal();

  final _repository = SettingsRepository();

  final BehaviorSubject<bool> _isAscendingSubject = BehaviorSubject<bool>();

  Stream<bool> get isAscendingStream => _isAscendingSubject.stream;

  /// Initialize shared preferences with a non-null value when
  /// app is ran for the first time.
  init() async {
    if (await _repository.getIsAscending() == null) {
      _repository.setIsAscending(false);
    }
  }

  Future<bool> getIsAscending() {
    return _repository.getIsAscending().then((isAscending) {
      _isAscendingSubject.sink.add(isAscending!);
      return isAscending;
    });
  }

  Future<void> setIsAscending(bool value) async {
    _isAscendingSubject.sink.add(value);
    _repository.setIsAscending(value);
  }

  void dispose() {
    _isAscendingSubject.close();
  }
}
