import 'package:flutter/material.dart';
import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Models/member.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';
import 'package:jamaithius_family/ui/Screens/FamilyListScreen/addNewFamilyForm.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/addNewMemeber.dart';

class MemberDetailScreen extends StatefulWidget {
  Member member;
  Family family;
  MemberDetailScreen({this.member,this.family});
  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState(member: member);
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  Member member;
  _MemberDetailScreenState({this.member});

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showMessage(String message, [MaterialColor color = Colors.blue]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: color,
      content: new Text(
        message,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            title: Text("Member Detail"),
            backgroundColor: AppColorsStyles.backgroundColour),
        // backgroundColor: AppColors.loginGradientStart,

        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                firstName(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                lastName(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                salutation(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                // relationShip(member),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   height: 1,
                //   color: Colors.black12,
                //   width: MediaQuery.of(context).size.width,
                // ),
                // SizedBox(height: 15),
                streetAddress1(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                 streetAddress2(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                city(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                state(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                zipCode(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                doNotCall(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                dayPhone(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                eveningPhone(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                mobilePhone(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                email(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                  doNotEmail(member),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                webUrl(member),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                dateOfBirth(member),
                // Container(
                //   height: 1,
                //   color: Colors.black12,
                //   width: MediaQuery.of(context).size.width,
                // ),
                SizedBox(height: 15),
                buttonAccept(member)
              ],
            ),
          ),
        ),
      ),
    );
  }

// for emplyee name widget
  Widget firstName(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("First name",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          member.firstName == null || member.firstName.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${member.firstName}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget lastName(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Last name",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.lastName == null || member.lastName.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :  Text(
            "${member.lastName}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget salutation(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Salutaion",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.salutation == null || member.salutation.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :  Text(
            "${member.salutation}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  // Widget relationShip(Member member) {
  //   return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text("Relationship",
  //             style: AppTypographyStyles.mainHeadingTextStyle
  //                 .apply(color: Colors.black54)),
  //         SizedBox(
  //           height: 5,
  //         ),
  //        member. Text(
  //           "Husband",
  //           style:
  //               AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
  //         )
  //       ]);
  // }

  Widget streetAddress1(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Street address 1",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.address1 == null || member.address1.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :  Text(
            "${member.address1}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }
   Widget streetAddress2(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Street address 2",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.address2 == null || member.address2.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :  Text(
            "${member.address2}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget city(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("City",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.city == null || member.city.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :   Text(
            "${member.city}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget state(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("State",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.state == null || member.state.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :  Text(
            "${member.state }",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget zipCode(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Zip Code",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.zipCode == null || member.zipCode.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) : Text(
            "${member.zipCode}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget doNotCall(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Memeber Call permission",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         
         member.donotcall== null || member.donotcall == false ? Text(
            "No",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.red),
          ):
           Text(
            "Yes",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.green),
          )
        ]);
  }

  Widget dayPhone(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Day phone",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.dayPhone == null || member.dayPhone.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :Text(
            "${member.dayPhone}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget eveningPhone(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Evening phone",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
        member.eveningPhone == null || member.eveningPhone.isEmpty ?  Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) : Text(
            "${member.eveningPhone}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget mobilePhone(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Mobile phone",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.mobilePhone == null || member.mobilePhone.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) : Text(
            "${member.mobilePhone}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget email(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Email",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.email == null || member.email.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) : Text(
            "${member.email}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

   Widget doNotEmail(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Memeber Email permission",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         
         member.donotemail== null || member.donotemail == false ? Text(
            "No",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.red),
          ):
           Text(
            "Yes",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.green),
          )
        ]);
  }

  Widget webUrl(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("web Url",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.weburl == null || member.weburl.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) : Text(
            "${member.weburl}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget dateOfBirth(Member member) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Date of birth",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
         member.dob == null || member.dob.isEmpty ? Text(
            "N/A",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          ) :  Text(
            "${DateTimeConverter.getDateAndTime(member.dob)}",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget buttonAccept(Member member) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     color:  AppColorsStyles.backgroundColour,
              //     offset: Offset(1.0, 3.0),
              //     blurRadius: 20.0,
              //   ),
              //   BoxShadow(
              //     color: AppColorsStyles.backgroundColour,
              //     offset: Offset(1.0, 3.0),
              //     blurRadius: 10.0,
              //   ),
              // ],
              gradient: new LinearGradient(
                  colors: [
                    AppColorsStyles.backgroundColour,
                    AppColorsStyles.backgroundColour
                  ],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: MaterialButton(
                highlightColor: AppColorsStyles.backgroundColour,
                splashColor: AppColorsStyles.backgroundColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 17.0),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontFamily: "WorkSansBold"),
                  ),
                ),
                onPressed: () {
                  showMessage("Not functional yet.");
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminDashboard()));
                }
                // showInSnackBar("Login button pressed")
                ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     color:  AppColorsStyles.backgroundColour,
              //     offset: Offset(1.0, 3.0),
              //     blurRadius: 20.0,
              //   ),
              //   BoxShadow(
              //     color:  AppColorsStyles.backgroundColour,
              //     offset: Offset(1.0, 3.0),
              //     blurRadius: 10.0,
              //   ),
              // ],
              gradient: new LinearGradient(
                  colors: [
                    AppColorsStyles.backgroundColour,
                    AppColorsStyles.backgroundColour
                  ],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: MaterialButton(
                highlightColor: AppColorsStyles.backgroundColour,
                splashColor: AppColorsStyles.backgroundColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 22.0),
                  child: Text(
                    "Edit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontFamily: "WorkSansBold"),
                  ),
                ),
                onPressed: () {
                 
  Family family;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewMemeber(editingMemberModel: member,isEditing: true, family: widget.family,)));
                }
                // showInSnackBar("Login button pressed")
                ),
          ),
        ],
      ),
    );
  }
}
