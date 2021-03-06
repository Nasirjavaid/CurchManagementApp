import 'dart:convert';

import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:http/http.dart' as http;
import 'package:jamaithius_family/config/appConstants.dart';

class FamilySearchService {


  Future<APIResponce<List<Family>>> getFamilySearchList(String keyWord) async {
    return http.get(APIConstants.familySearchApi+"$keyWord").then((data) {
      if (data.statusCode == 200) {
        final jsonDataAsMap = json.decode(data.body);
        final familyList = <Family>[];

        print("Responce in family search service : $jsonDataAsMap");

        for (var memberItem in jsonDataAsMap) {
          Family family = Family.fromJson(memberItem);
          print("${family.familyName}");
          familyList.add(family);
        }
        print('Ley word search $keyWord');
      
        return APIResponce<List<Family>>(data: familyList);
      }

      return APIResponce<List<Family>>(
          error: true,
          errorMessage: "Error occured in Family Service File !!!");
    }).catchError((Object exception) => APIResponce<List<Family>>(
        error: true,
        errorMessage:
            "Error occured in Family service with this Exception $exception"));
  }
}
