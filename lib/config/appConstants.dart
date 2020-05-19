import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


/*
Styles for typography
*/

// TO DO : Finalize Font Family for the app

class AppTypoGraphy {

    static TextStyle errorHintStyle = TextStyle(color: Colors.white70);
  } 
class AppTypographyStyles {
  static TextStyle titleTextStyle = TextStyle(
      color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 12);

  static TextStyle smallTextStyle = TextStyle(
    color: Colors.white60,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static TextStyle smallTextStyleNotVailable = TextStyle(
      color: Color.fromRGBO(107, 125, 135, .9),
      fontWeight: FontWeight.bold,
      fontSize: 13);

  static TextStyle headingTextStyle =
      TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold);

  static TextStyle mainHeadingTextStyle = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white);
}

// TO DO : Finalize Font Family for the app
class AppColorsStyles {
  static Color mainColorAscent = Colors.yellow;
  static Color backgroundColour = Color.fromRGBO(58, 66, 86, 1.0);
  
}

class APIConstants {
  static const String baseUrl = "http://churchi.somee.com";
  static const String familyApi = baseUrl+"/api/Families/getFamilies?churchID=1&page=";
  static const String memberByFamilyIdApi = baseUrl+"/api/Members/getMembers?familyID="; 
  static const String familySearchApi = baseUrl+"/api/Families/searchFamily?churchID=1&familyName="; 
  static const String loginApiPart1 = baseUrl+"/api/Login/VerifyLogin?user="; 
  static const String loginApiPart2 ="&pass="; 


  static const String insertFamilyApi =baseUrl+"/api/Families/insertFamily?"; 

  
  
}

class AppColours {
  static Color backgroundColorForApp = Color.fromRGBO(58, 66, 86, 1.0);
  static Color backgroundColorForCards = Color.fromRGBO(64, 75, 96, .9);
}

enum ViewState { Idle, Busy, Retrieved, Error }

class NetworkConnectivity {
  static const String NETWORK_NOT_AVAILABLE =
      "Internet connection is not available";

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
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


