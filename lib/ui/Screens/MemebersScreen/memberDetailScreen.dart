import 'package:flutter/material.dart';
import 'package:jamaithius_family/config/appConstants.dart';


class MemberDetailScreen extends StatefulWidget {
  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
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
                firstName(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                lastName(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                salutation(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                relationShip(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                streetAddress(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                city(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                state(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                zipCode(),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                doNotCall(),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                dayPhone(),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                eveningPhone(),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                mobilePhone(),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                email(),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                webUrl(),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                dateOfBirth(),
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
  Widget firstName() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("First name",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "James bond",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget lastName() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Last name",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "jimmy",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget salutation() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Salutaion",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "not mentioned yet",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget relationShip() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Relationship",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "Husband",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget streetAddress() {
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
            "street #12 down town New York",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

  Widget city() {
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

  Widget state() {
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
                "Maxico"   ,
                         style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }


   Widget zipCode() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Zip Code",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "364834",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

 Widget doNotCall() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Memeber Call permission",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "Memeber do not want to receive a call",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

   Widget dayPhone() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Day phone",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "+190874537453",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

   Widget eveningPhone() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Eveingi phone",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "+190874537453",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

 Widget mobilePhone() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Mobile phone",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "+190874537453",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }
 Widget email() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Email",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "abc@gmail.com",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

 Widget webUrl() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("web Url",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "www.google.com",
            style:
                AppTypographyStyles.smallTextStyle.apply(color: Colors.black38),
          )
        ]);
  }

   Widget dateOfBirth() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Date of birth",
              style: AppTypographyStyles.mainHeadingTextStyle
                  .apply(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            "2020-4-05",
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
                  colors: [AppColorsStyles.backgroundColour, AppColorsStyles.backgroundColour],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: MaterialButton(
                highlightColor:  AppColorsStyles.backgroundColour,
                splashColor:  AppColorsStyles.backgroundColour,
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
                  colors: [AppColorsStyles.backgroundColour, AppColorsStyles.backgroundColour],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: MaterialButton(
                highlightColor:  AppColorsStyles.backgroundColour,
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
                  showMessage("Not Functional yet.");
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminDashboard()));
                }
                // showInSnackBar("Login button pressed")
                ),
          ),
        ],
      ),
    );
  }
}
