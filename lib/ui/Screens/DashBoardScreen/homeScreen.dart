import 'package:flutter/material.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';
import 'package:jamaithius_family/ui/Screens/FamilyListScreen/familyListScreen.dart';
import 'package:jamaithius_family/ui/Screens/FamilyListScreen/addNewFamilyForm.dart';
import 'package:jamaithius_family/ui/Screens/LoginScreen/loginScreen.dart';

class DashBordScreen extends StatefulWidget {
  @override
  _DashBordScreenState createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  // HttpService httpService = HttpService();
//  HttpServiceSmDeliveryChallan httpServiceSmDeliveryChallan;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // callCheck();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:
             Text(
          "Church Management",
          style: AppTypographyStyles.mainHeadingTextStyle,
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),


          actions: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(Icons.settings_power, color: Colors.white),
              ),
              onTap: () {
                showAlertDialog(context);
              },
            )
          ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          buildCardWithIcon(
            Icons.people,
            context,
            () async {
              await NetworkConnectivity.check().then((internet) async {
                // clear past user

                if (internet) {
                  // go to other screen

                  //  showMessage("TODO: DO SOMETHING HERE");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddNewFamilyForm();
                  }));
                } else {
                  //show network erro
                 showMessageError("Network is not avalable !!!");
                }
              });
            },
            "Add Family",
          ),
          // buildCardWithIcon(
          //   Icons.person_add,
          //   context,
          //   () {

          //    //showMessage("TODO: DO SOMETHING HERE");
          //      Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return AddNewMemeber();
          //     }));

          //   },
          //   "Add Member",
          // ),
          buildCardWithIcon(
            Icons.people_outline,
            context,
            () {
              NetworkConnectivity.check().then((internet) async {
                // clear past user

                if (internet) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FamilyListViewScreen();
                      },
                    ),
                  );
                } else {
                  //show network erro
                  showMessageError("Network is not avalable !!!");
                }
              });

              //  showMessage("TODO: DO SOMETHING HERE");
            },
            "All Famlies",
          ),
          // buildCardWithIcon(
          //   Icons.person,
          //   context,
          //   () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return MemeberListScreen();
          //     }));
          //     // showMessage("TODO: DO SOMETHING HERE");
          //   },
          //   "All Members",
          // ),
          buildCardWithIcon(
            Icons.widgets,
            context,
            () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return CommonListViewScreen();
              // }));
              showMessage("Not available Yet");
            },
            "Templates",
          ),
          buildCardWithIcon(
            Icons.book,
            context,
            () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return CommonListViewScreen();
              // }));
              showMessage("Not available Yet");
            },
            "Documents",
          ),
          buildCardWithIcon(
            Icons.email,
            context,
            () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return CommonListViewScreen();
              // }));
              showMessage("Not available Yet");
            },
            "Email",
          ),
          buildCardWithIcon(
            Icons.account_circle,
            context,
            () {
              // Navigator.of(context).pushReplacement(
              //   new MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return CommonListViewScreen();
              //     },
              //   ),
              // );
              showMessage("Not available Yet");
            },
            "Accounts",
          ),
          buildCardWithIcon(
            Icons.report,
            context,
            () {
              // Navigator.of(context).pushReplacement(
              //   new MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return CommonListViewScreen();
              //     },
              //   ),
              // );
              showMessage("Not available Yet");
            },
            "Reports",
          ),
          buildCardWithIcon(
            Icons.sms,
            context,
            () {
              // Navigator.of(context).pushReplacement(
              //   new MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return CommonListViewScreen();
              //     },
              //   ),
              // );
              showMessage("Not available Yet");
            },
            "SMS",
          ),
          buildCardWithIcon(
            Icons.call,
            context,
            () {
              // Navigator.of(context).pushReplacement(
              //   new MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return CommonListViewScreen();
              //     },
              //   ),
              // );
              showMessage("Not available Yet");
            },
            "Phone",
          ),

          buildCardWithIcon(
            Icons.account_box,
            context,
            () {
              // Navigator.of(context).pushReplacement(
              //   new MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return CommonListViewScreen();
              //     },
              //   ),
              // );
              showMessage("Not available Yet");
            },
            "My Accounts",
          ),

          buildCardWithIcon(
            Icons.library_books,
            context,
            () {
              // Navigator.of(context).pushReplacement(
              //   new MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return CommonListViewScreen();
              //     },
              //   ),
              // );
              showMessage("Not available Yet");
            },
            "Certificates",
          )
        ],
      ),
    );
  }

  Padding buildCardWithIcon(
      IconData icon, context, VoidCallback onTap, String pageName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: AppColours.backgroundColorForCards,
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  pageName,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w700),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


 Widget showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(color: Colors.black87),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Logout",
        style: TextStyle(color: Colors.black87),
      ),
      onPressed: () {
        LoginPrefrences loginPrefrences = LoginPrefrences();
        loginPrefrences.setUser(false);

        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return LoginScreen();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 2.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }),
            (Route route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout !"),
      content: Text("You will be returned to login screen."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

