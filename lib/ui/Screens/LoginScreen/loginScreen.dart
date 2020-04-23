import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/ui/Screens/DashBoardScreen/homeScreen.dart';


class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {

@override
  void initState() {
    // TODO: implement initState
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final snackBar = SnackBar(content: Text('Data processing '));
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
      
      cursorColor: AppColours.backgroundColorForApp,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 128,
      style: TextStyle(
        color:  AppColours.backgroundColorForCards,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.alternate_email,
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
          hintText: "Email",
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
          return "Please ener email";
        } else {
          return null;
        }
      },
    );

    final password = TextFormField(
      
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

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () {
         

          if (_formKey.currentState.validate()) {
          //   // If the form is valid, display a Snackbar.
          //  Scaffold.of(context).showSnackBar(snackBar);
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBordScreen()),
          );
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
                      loginButton,
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
