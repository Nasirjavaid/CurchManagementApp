import 'dart:convert';

import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:http/http.dart' as http;
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';

class FamilyService {
  Future<APIResponce<List<Family>>> getFamilyList(int pageNumber) async {
    return http.get(APIConstants.familyApi + "$pageNumber").then((data) {
      if (data.statusCode == 200) {
        final jsonDataAsMap = json.decode(data.body);
        final familyList = <Family>[];

        //  print("Responce in family service : $jsonDataAsMap");

        for (var memberItem in jsonDataAsMap) {
          Family family = Family.fromJson(memberItem);
          //  print("${family.familyName}");
          familyList.add(family);
        }
        print('Now on page $pageNumber');

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

  Future<APIResponce<int>> insertFamily(Family family) async {

     Family familyModel = Family();
    final data = await http.post(APIConstants.insertOrUpdateFamilyApi +
        APIConstants.churchID +
        family.churchId.toString() +
        "&" +
        APIConstants.familyID +
        family.familyId.toString() +
        "&" +
        APIConstants.familyName +
        family.familyName +
        "&" +
        APIConstants.address1 +
        family.address1 +
        "&" +
        APIConstants.address2 +
        "test" +
        "&" +
        APIConstants.city +
        family.city +
        "&" +
        APIConstants.state +
        family.state +
        "&" +
        APIConstants.zip_code +
        family.zipCode +
        "&" +
        APIConstants.home_phone +
        family.homePhone +
        "&" +
        APIConstants.email +
        family.email +
        "&" +
        APIConstants.weburl +
        family.weburl +
        "&" +
        APIConstants.wedding_date +
        "${DateTimeConverter.getDateAndTime(family.weddingDate)}");

    if (data.statusCode == 200) {
      print(" body text :  ${data.body}");

       final jsonDataasMap = json.decode(data.body);

        for (var i in jsonDataasMap) {
         
          familyModel =Family.fromJson(i);
          print(
              "Family name  ${familyModel.familyName} and family id  ${familyModel.familyId}");
        }
      return APIResponce<int>(data:familyModel.familyId);
    }

    return APIResponce<int>(
        data: 0,
        error: true,
        errorMessage: "An error occured while subbmiting data");
  }
}

// Future<APIResponce<bool>> insertFamily(Family family) async {

//   http.post(
//     APIConstants.insertFamilyApi,
//    headers: <String, String>{
//     'Content-Type': 'application/json; charset=UTF-8',
//   },
//      body : jsonEncode(<String, dynamic>{

//       'churchID': 1,
//       'familyID': 0,
//       'familyName': 'Test',
//       'address1': 'Test',
//       'address2':  'Test',
//       'city':  'Test',
//       'state': 'Test',
//       'zip_code':  'Test',
//       'home_phone':  'Test',
//       'email':  'Test',
//       'weburl':  'Test',
//       'wedding_date': 05/29/2015%2005/50/06,

//     }),
//   )

//       .then((data) {
//         print(" body text :  ${data.body}");
//     if (data.statusCode == 201) {
//       print(" body text :  ${data.body}");
//       return APIResponce<bool>(data: true);
//     }

//     return APIResponce<bool>(
//         data: false,
//         error: true,
//         errorMessage: "An error occured while subbmiting data");
//   }).catchError((_) => APIResponce<bool>(
//           data: false,
//           error: true,
//           errorMessage: "An error occured while subbmiting data"));
// }

//  body: json.encode(<String, dynamic>{
//         //  '$id' = family.id;

//         'churchID': family.churchId,
//         'familyID': family.id,
//         'familyName': family.familyName,
//         'address1': family.address1,
//         'address2': family.address2,
//         'city': family.city,
//         'state': family.state,
//         'zip_code': family.zipCode,
//         'home_phone': family.homePhone,
//         'email': family.email,
//         'weburl': family.weburl,
//         'wedding_date': family.weddingDate
//       }),
//     )
