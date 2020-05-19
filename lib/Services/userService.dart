import 'dart:convert';

import 'package:jamaithius_family/Models/user.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';

import 'package:http/http.dart' as http;
import 'package:jamaithius_family/config/appConstants.dart';

class UserService {
 
  Future<APIResponce<User>> getUserAuth(
      String userName, String password) async {
        
    print("user data in api call as input : $userName and $password");

    final data = await http.get(APIConstants.loginApiPart1 +
        userName +
        APIConstants.loginApiPart2 +
        password);

     User user = User();
      if (data.statusCode == 200) {
        print("object ${data.body}");

        final jsonDataasMap = json.decode(data.body);

        for (var i in jsonDataasMap) {
          user = User.fromJson(i);
          print(
              "User auth api called :'in services' ${user.smtpUser} :  ${user.smtpPassword}");
        }
        return APIResponce<User>(data: user);
      }

      return APIResponce<User>(
          error: true,
          errorMessage: "An error occured in User services class !!!!!");
    
  }
}
