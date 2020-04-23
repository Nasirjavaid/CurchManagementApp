import 'package:flutter/material.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/addNewMemeber.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/memberListScreen.dart';

class FamilyDetailScreen extends StatefulWidget {
  @override
  _FamilyDetailScreenState createState() => _FamilyDetailScreenState();
}

class _FamilyDetailScreenState extends State<FamilyDetailScreen> {
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
            backgroundColor: AppColorsStyles.backgroundColour),
        // backgroundColor: AppColors.loginGradientStart,

        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 15, left: 15),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                familName(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                registeredDate(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyStreetAddress(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyCity(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyState(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyAizCode(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyWebUrl(),

                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                familyMentor(),
                SizedBox(
                  height: 5,
                ),
                // Container(
                //   height: 1,
                //   color: Colors.black12,
                //   width: MediaQuery.of(context).size.width,
                // ),
                SizedBox(height: 15),
                buttonAccept()
              ],
            ),
          ),
        ),
      ),
    );
  }

// for emplyee name widget
  Widget familName() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Family name",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "Json Alvi",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget registeredDate() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Registered date",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "2020-03-25",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget familyStreetAddress() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Street address",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "St# 12 Doen Town New York",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget familyCity() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("City",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "New York",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget familyState() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("State",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "New jercy",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget familyAizCode() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("ZipCode",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "39350",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget familyWebUrl() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Web url",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "https://www.googleapis.com/",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

   Widget familyMentor() {
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

  Widget buttonAccept() {
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
                  colors: [ AppColorsStyles.backgroundColour,  AppColorsStyles.backgroundColour],
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewMemeber()));
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
                  colors: [ AppColorsStyles.backgroundColour,  AppColorsStyles.backgroundColour],
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
                  child: Row(
                                      children:<Widget>[ Text(
                      "Family members",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: "WorkSansBold"),
                    ),
                                      ]),
                ),
                onPressed: () {
                 // showMessage("Dummy leave Accepted");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MemeberListScreen()));
                }
                // showInSnackBar("Login button pressed")
                ),
          ),
        ],
      ),
    );
  }
}
