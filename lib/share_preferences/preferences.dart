// *******************************
// SHARE PREFERENCES ************+
// *******************************
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _prefs;

  static bool _isActivedNotifications = false;
  static String _userName = '';
  
  static Future init() async{
     _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _userName;
  }

  static set name(String name){
    _userName = name;
    _prefs.setString('name', name);
  }

  static bool get isNotifications {
    return _prefs.getBool('isNotifications') ?? _isActivedNotifications;
  }

  static set notifications(bool value){
    _isActivedNotifications = value;
    _prefs.setBool('isNotifications', value);
  }


}