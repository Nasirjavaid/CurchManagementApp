import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPrefrences {

  static const USER_STATUS = "user";

  setUser(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("User sent value $value");
    prefs.setBool(USER_STATUS, value);
  }

  Future<bool> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(USER_STATUS) ?? false;
  }
}

class DateTimeConverter {
 static String getDateAndTime(String rawDateAndTime) {
    var rawDate = DateTime.tryParse(rawDateAndTime);
    var formatter = new DateFormat.yMMMMd();
    String formatted = formatter.format(rawDate);

    return formatted;
  }
}

