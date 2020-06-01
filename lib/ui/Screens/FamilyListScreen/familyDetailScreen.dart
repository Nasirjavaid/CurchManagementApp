import 'package:flutter/material.dart';
import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';
import 'package:jamaithius_family/ui/Screens/FamilyListScreen/addNewFamilyForm.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/addNewMemeber.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/memberListScreen.dart';

class FamilyDetailScreen extends StatefulWidget {

  
  Family family;

  FamilyDetailScreen({this.family});

  @override
  _FamilyDetailScreenState createState() =>
      _FamilyDetailScreenState(family: family);
}

class _FamilyDetailScreenState extends State<FamilyDetailScreen> {
  Family family;
  _FamilyDetailScreenState({this.family});
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
          title: Text("Family detail"),
          backgroundColor: AppColorsStyles.backgroundColour,
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                NetworkConnectivity.check().then((internet) async {
                  // clear past user

                  if (internet) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNewFamilyForm(
                                  familyEditingModel: family,
                                  isEditing: true,
                                )));
                  } else {
                    //show network erro
                    showMessageError("Network is not avalable !!!");
                  }
                });
              },
            )
          ],
        ),
        // backgroundColor: AppColors.loginGradientStart,

        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                familName(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),

                familWeddingDate(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),

                familHomePhone(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),

                familEmail(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                registeredDate(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyStreetAddress1(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyStreetAddress2(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyCity(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyState(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyAizCode(family),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyWebUrl(family),

                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyMentor(family),
                SizedBox(
                  height: 5,
                ),
                // Container(
                //   height: 1,
                //   color: Colors.black12,
                //   width: MediaQuery.of(context).size.width,
                // ),
                SizedBox(height: 15),
                buttonAccept(family)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget familName(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Family name",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.familyName == null || family.familyName.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.familyName}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familWeddingDate(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Wedding Date",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.weddingDate == null || family.weddingDate.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${DateTimeConverter.getDateAndTime(family.weddingDate)}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familHomePhone(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Home Phone.",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.homePhone == null || family.homePhone.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.homePhone}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familEmail(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Email",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.email == null || family.email.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.email}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget registeredDate(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Registered Date",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.createddate == null || family.createddate.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${DateTimeConverter.getDateAndTime(family.createddate)}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familyStreetAddress1(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Street address 1",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.address1 == null || family.address1.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.address1}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familyStreetAddress2(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Street address 2",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.address2 == null
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.address2}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familyCity(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("City",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.city == null || family.city.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.city}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familyState(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("State",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.state == null || family.state.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.state}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familyAizCode(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("ZipCode",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.zipCode == null || family.zipCode.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.zipCode}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familyWebUrl(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Web url",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          family.weburl == null || family.weburl.isEmpty
              ? Text(
                  "N/A",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
              : Text(
                  "${family.weburl}",
                  style: AppTypographyStyles.smallTextStyle
                      .apply(color: Colors.black38),
                )
        ]);
  }

  Widget familyMentor(Family family) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Mentor/Coach",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "Not mentioned yet",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget buttonAccept(Family family) {
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
              //     color: AppColorsStyles.backgroundColour,
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
                      vertical: 5.0, horizontal: 8.0),
                  child: Text(
                    "Add Member",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontFamily: "WorkSansBold"),
                  ),
                ),
                onPressed: () {
                  // showMessage("Dummy leave rejectted");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNewMemeber(familyId: family.familyId,isEditing: false,)));
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
              //    // color: AppColorsStyles.backgroundColour,
              //     offset: Offset(1.0, 3.0),
              //     blurRadius: 20.0,
              //   ),
              //   BoxShadow(
              //    // color: AppColorsStyles.backgroundColour,
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
                // highlightColor: AppColorsStyles.backgroundColour,
                // splashColor: AppColorsStyles.backgroundColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  child: Row(children: <Widget>[
                    Text(
                      "Family members",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: "WorkSansBold"),
                    ),
                  ]),
                ),
                onPressed: () {
                  NetworkConnectivity.check().then((internet) async {
                    // clear past user

                    if (internet) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemeberListScreen(
                                    family: family,
                                  )));
                    } else {
                      //show network erro
                      showMessageError("Network is not avalable !!!");
                    }
                  });
                }
                // showInSnackBar("Login button pressed")
                ),
          ),
        ],
      ),
    );
  }

  void showMessageError(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: color,
      content: new Text(
        message,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      duration: const Duration(seconds: 1),
    ));
  }
}
