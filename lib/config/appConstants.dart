import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';



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


  static const String insertOrUpdateFamilyApi ="http://churchi.somee.com/api/Families/insertFamily?"; 

    static const String churchID ="churchID=";
    static const String familyID ="familyID=";
    static const String familyName ="familyName=";
    static const String address1 ="address1=";
    static const String address2 ="address2=";
    static const String city ="city=";
    static const String state ="state=";
    static const String zip_code ="zip_code=";
    static const String home_phone ="home_phone=";
    static const String email ="email=";
    static const String weburl ="weburl=";
    static const String wedding_date ="wedding_date=";



 

    static const String inserOrUpdateMemberApi ="http://churchi.somee.com/api/Members/InsertMember?"; 


    static const String mChurchId ="churchID=";
    static const String mMemberId ="memberID=";
    static const String mFamilyId ="familyID=";
    static const String mFirstName ="firstName=";
    static const String mLatName ="lastName=";
    static const String mAddress1 ="address1=";
    static const String mAddress2 ="address2=";
    static const String mCity ="city=";
    static const String mState ="state=";
    static const String mZipCode ="zip_code=";
    static const String mDayPhone ="dayPhone=";
    static const String mEveningPhone ="eveningPhone=";
    static const String mMobilePhone ="mobilePhone=";
    static const String mEamil ="email=";
    static const String mWebUrl ="weburl=";
    static const String mDob ="dob=";
    static const String mMemberShipNo ="membershipno=";
    static const String misMemeber ="isMember=";
    static const String mSalutation ="salutation=";
    static const String mRelationshipID ="relationshipID=";



  
  
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



