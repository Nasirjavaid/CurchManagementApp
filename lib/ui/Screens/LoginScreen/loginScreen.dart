import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jamaithius_family/Models/user.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:jamaithius_family/Services/userService.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';
import 'package:jamaithius_family/ui/Screens/DashBoardScreen/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final snackBar = SnackBar(content: Text('Data processing '));

  //Getting user service to get User Auth
  UserService get userService => GetIt.I<UserService>();
  //Api responce call for user Auth
  APIResponce <User> apiResponce;
  bool isLoading = false;
  bool userAuth = false;

  //Text editing controllers

  TextEditingController emaillController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  void showMessageSuccess(String message, [MaterialColor color = Colors.blue]) {
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

//fetching user details
  Future<bool> fetchUserAuth() async {
     setState(() {
      isLoading = true;
    });

    apiResponce = await userService.getUserAuth(emaillController.text,passwordController.text);

    print("apiiiii    ${apiResponce.data.smtpPassword}");

     if (apiResponce == null) {
     // showMessageError("Something went wrong !");

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      return false;
    }

    if (apiResponce.data.smtpPassword != null ) {
      // showMessageError("Wrong user name or password !");

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      return true;
    }


    // print("${apiResponce.data.authenticatoin}");
    // print("${apiResponce.data.response}");

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50.0,
        child: Icon(
          Icons.person_pin,
          color: Color.fromRGBO(64, 75, 96, .9),
          size: 100.0,
        ),
      ),
    );

    final email = TextFormField(
      controller: emaillController,
      cursorColor: AppColours.backgroundColorForApp,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 128,
      style: TextStyle(
        color: AppColours.backgroundColorForCards,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person_outline,
            size: 17,
            color: AppColours.backgroundColorForCards,
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: const OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: Color.fromRGBO(64, 75, 96, .9),
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: Color.fromRGBO(64, 75, 96, .9),
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          focusedBorder: const OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: Color.fromRGBO(64, 75, 96, .9),
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          hintText: "User name",
          hintStyle: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String email) {
        if (email.isEmpty) {
          return "Please enter ser name";
        } else {
          return null;
        }
      },
    );

    final password = TextFormField(
      controller: passwordController,
      obscureText: true,
      cursorColor: Color.fromRGBO(64, 75, 96, .9),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 128,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            size: 17,
            color: Color.fromRGBO(64, 75, 96, .9),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: const OutlineInputBorder(
              borderSide: const BorderSide(

                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: Color.fromRGBO(64, 75, 96, .9),
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: Color.fromRGBO(64, 75, 96, .9),
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          focusedBorder: const OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: Color.fromRGBO(64, 75, 96, .9),
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String password) {
        if (password.isEmpty) {
          return "Please enter password";
        } else {
          return null;
        }
      },
    );

    // final password = TextFormField(
    //   autofocus: false,
    //   obscureText: true,
    //   decoration: InputDecoration(
    //     hintText: 'Password',
    //     hintStyle: TextStyle(color: Colors.white54),
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    //   ),
    // );

    final progressIndicator = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
            ),
          ],
        ));

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // netWorkChek();
            LoginPrefrences loginPrefrences = LoginPrefrences();

            NetworkConnectivity.check().then((internet) async {
             
                bool userAuth = await fetchUserAuth();
                   print("user auth main : $userAuth");

                setState(() {
                  isLoading = true;
                });
              if (internet) {

                Future.delayed(const Duration(milliseconds: 2000), () {
                  print("user auth : $userAuth");
                  if (userAuth) {
                    loginPrefrences.setUser(true);

                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(pageBuilder: (BuildContext context,
                            Animation animation, Animation secondaryAnimation) {
                          return DashBordScreen();
                        }, transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return new SlideTransition(
                            position: new Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        }),
                        (Route route) => false);
                  } else {
                    showMessageError("Wrong User Name or Password");

                    setState(() {
                      isLoading =false;
                    });
                  }
                });
              } else {
                //show network erro
                showMessageError("Network is not avalable");
              }
            });
          }
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(64, 75, 96, .9),
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    // final backtext = FlatButton(
    //   child: Text(
    //     'click in login to goto first screen!',
    //     style: TextStyle(color: Colors.black54),
    //   ),
    //   onPressed: () {},
    // );

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 15),
                    children: <Widget>[
                      // X1Demo(),
                      // Text('happy birthday login),
                      logo,
                      SizedBox(height: 48.0),
                      email,
                      SizedBox(height: 8.0),
                      password,
                      SizedBox(height: 14.0),
                      Container(
                          child: isLoading ? progressIndicator : loginButton),
                      //backtext
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
