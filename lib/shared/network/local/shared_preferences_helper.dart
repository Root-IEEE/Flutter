import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final String _kCountryCodePrefs = "countryCode";
  final String _kCountryNamePrefs = "countryName";
  final String _userType = 'userType';
  final String _loggedInUserId = '_loggedInUserId';
  final String _schoolCode = 'schoolCode';
  final String _photoUrl = 'photoUrl';
  final String _childIds = 'childIds';
  final String _parentsIds = 'parentsIds';
  final String _userModel = 'userJsonModel';

  //Method to save User model in json format
  Future<bool> setUserDataModel(String jsonModel) async {
    return true;
  }

  //Method to retrive User model in json format
  Future<String> getUserDataModel() async {
    return '';
  }

}