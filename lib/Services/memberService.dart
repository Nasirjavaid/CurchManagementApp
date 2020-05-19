import 'dart:convert';

import 'package:jamaithius_family/Models/member.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:http/http.dart' as http;
import 'package:jamaithius_family/config/appConstants.dart';

class MemberService {
  Future<APIResponce<List<Member>>> getMemeberList(int familyId) async {
    return http.get(APIConstants.memberByFamilyIdApi+"$familyId").then((data) {
      if (data.statusCode == 200) {
        final jsonDataAsMap = json.decode(data.body);
        final memberList = <Member>[];

        for (var memberItem in jsonDataAsMap) {
          Member memeber = Member.fromJson(memberItem);
          print(" Member Names ${memeber.firstName}");
          memberList.add(memeber);
        }
        
        return APIResponce<List<Member>>(data: memberList);
      }

      return APIResponce<List<Member>>(
          error: true,
          errorMessage: "Error occured in Memeber Service File !!!");
    }).catchError((Object exception) => APIResponce<List<Member>>(
        error: true,
        errorMessage:
            "Error occured in Member service with this Exception $exception"));
  }


 
}
