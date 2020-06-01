import 'dart:convert';

import 'package:jamaithius_family/Models/member.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:http/http.dart' as http;
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';

class MemberService {
  Future<APIResponce<List<Member>>> getMemeberList(int familyId) async {
    return http.get(APIConstants.memberByFamilyIdApi+"$familyId").then((data) {
      if (data.statusCode == 200) {
        final jsonDataAsMap = json.decode(data.body);
        print("$jsonDataAsMap");
        final memberList = <Member>[];

        for (var memberItem in jsonDataAsMap) {
          Member memeber = Member.fromJson(memberItem);
          print(" Member Names ${memeber.firstName}");
          print(" Member family id in service  ${memeber.familyId}");
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


  Future<APIResponce<bool>> insertOrUpdateFamilyMember(Member member) async {

    //    static const String inserOrUpdateMemberApi ="http://churchi.somee.com/api/Members/InsertMember?
    // churchID=1&memberID=0&familyID=33&firstName=zeeshan&lastName=alijut&address1=kotraaa&address2=toba%20taksing&
    // city=rawalpindi&state=missisipi&zip_code=56000&dayPhone=0302565&eveningPhone=0324516&
    // mobilePhone=0313546&email=xzcnh@gmail.com&weburl=txyh.pk&dob=05/29/2015%2005:50:06&membershipno=23&
    // isMember=True&salutation=Mr&relationshipID=3"; 


print(APIConstants.inserOrUpdateMemberApi + APIConstants.mChurchId+member.churchId.toString()+"&"
    +APIConstants.mMemberId+member.memberId.toString()+"&"
    +APIConstants.mFamilyId+member.familyId.toString()+"&"
    +APIConstants.mFirstName+member.firstName+"&"
    +APIConstants.mLatName+member.lastName+"&"
    +APIConstants.mAddress1+member.address1+"&"
    +APIConstants.mAddress2+member.address2+"&"
    +APIConstants.mCity+member.city+"&"
    +APIConstants.mState+member.state+"&"
    +APIConstants.mZipCode+member.zipCode+"&"
    +APIConstants.mDayPhone+member.dayPhone+"&"
    +APIConstants.mEveningPhone+member.eveningPhone+"&"
    +APIConstants.mMobilePhone+member.mobilePhone+"&"
    +APIConstants.mEamil+member.email+"&"
    +APIConstants.mWebUrl+member.weburl+"&"
    +APIConstants.mDob+"${DateTimeConverter.getDateAndTime(member.dob)}"+"&"
    +APIConstants.mMemberShipNo+member.membershipNo+"&"
    +APIConstants.misMemeber+member.isMember.toString()+"&"
    +APIConstants.mSalutation+member.salutation+"&"
    +APIConstants.mRelationshipID+member.relationShipId.toString());


     Member memberModel = Member();
    final data = await http.post(APIConstants.inserOrUpdateMemberApi +

    APIConstants.mChurchId+member.churchId.toString()+"&"
    +APIConstants.mMemberId+member.memberId.toString()+"&"
    +APIConstants.mFamilyId+member.familyId.toString()+"&"
    +APIConstants.mFirstName+member.firstName+"&"
    +APIConstants.mLatName+member.lastName+"&"
    +APIConstants.mAddress1+member.address1+"&"
    +APIConstants.mAddress2+member.address2+"&"
    +APIConstants.mCity+member.city+"&"
    +APIConstants.mState+member.state+"&"
    +APIConstants.mZipCode+member.zipCode+"&"
    +APIConstants.mDayPhone+member.dayPhone+"&"
    +APIConstants.mEveningPhone+member.eveningPhone+"&"
    +APIConstants.mMobilePhone+member.mobilePhone+"&"
    +APIConstants.mEamil+member.email+"&"
    +APIConstants.mWebUrl+member.weburl+"&"
    +APIConstants.mDob+"${DateTimeConverter.getDateAndTime(member.dob)}"+"&"
    +APIConstants.mMemberShipNo+member.membershipNo+"&"
    +APIConstants.misMemeber+member.isMember.toString()+"&"
    +APIConstants.mSalutation+member.salutation+"&"
    +APIConstants.mRelationshipID+member.relationShipId.toString()

    );
 print(" body text in member update or add new  :  ${data.body}");
    if (data.statusCode == 200) {
      print(" body text in member update or add new  :  ${data.body}");

       final jsonDataasMap = json.decode(data.body);

       print("member responce : $jsonDataasMap");

        for (var i in jsonDataasMap) {
         
          memberModel =Member.fromJson(i);
          print(
              "Family name  ${memberModel.firstName} and family id  ${memberModel.address1}");
        }
      return APIResponce<bool>(data: true);
    }

    return APIResponce<bool>(
        data: false,
        error: true,
        errorMessage: "An error occured while subbmiting data");
  }
}


