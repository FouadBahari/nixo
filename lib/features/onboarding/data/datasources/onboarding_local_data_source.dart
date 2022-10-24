import 'package:nixo/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  Future<bool> isFirstTime();
}

class OnBoardingLocalDataSourceImpl extends OnBoardingLocalDataSource {
  final SharedPreferences prefs;
  OnBoardingLocalDataSourceImpl({required this.prefs});

  @override
  Future<bool> isFirstTime() async {
    try {
      // prefs.clear();
      bool boolValue = prefs.getBool('IS_FIRST_TIME') ?? true;
      prefs.setBool('IS_FIRST_TIME', false);
      return boolValue;
    } catch (e) {
      throw LocalException();
    }
  }
}
