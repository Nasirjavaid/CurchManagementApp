import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamaithius_family/config/appConstants.dart';

class AddNewFamilyForm extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _AddnewFamilyFormState createState() => new _AddnewFamilyFormState();
}

class _AddnewFamilyFormState extends State<AddNewFamilyForm> {
  DateTime selectedDate = DateTime.now();

  TextEditingController etDateController = TextEditingController();
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
          Icons.people,
          color: Color.fromRGBO(64, 75, 96, .9),
          size: 50.0,
        ),
      ),
    );

    final etFamilyName = Container(
        height: 60,
        child: TextFormField(
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 300,
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          decoration: InputDecoration(
            counterText: "",
              prefixIcon: Icon(
                Icons.people,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Family name",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String familyname) {
            if (familyname.isEmpty) {
              return "Please Add Family name";
            } else {
              return null;
            }
          },
        ));
    final etWeddingDate = Container(
        height: 60,
        child: TextFormField(
          maxLines: 1,
          minLines: 1,
          controller: etDateController,
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 30,
          style: TextStyle(
              color: Color.fromRGBO(64, 75, 96, .9),
              //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              fontSize: 14),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.date_range,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Wedding date",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String weddingDate) {
            if (weddingDate.isEmpty) {
              return "Please Wedding Date";
            } else {
              return null;
            }
          },
        ));

    final etFamilyStreetAddress = Container(
        height: 60,
        child: TextFormField(
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 300,
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          decoration: InputDecoration(
             counterText: "",
              prefixIcon: Icon(
                Icons.location_city,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Family's street address",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String address) {
            if (address.isEmpty) {
              return "Please add family's street address";
            } else {
              return null;
            }
          },
        ));

    final etFamilyCity = Container(
        height: 60,
        child: TextFormField(
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 300,
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          decoration: InputDecoration(
             counterText: "",
              prefixIcon: Icon(
                Icons.location_on,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Family's city",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String city) {
            if (city.isEmpty) {
              return "Please add famliy's city";
            } else {
              return null;
            }
          },
        ));

    final etFamilyState = Container(
        height: 60,
        child: TextFormField(
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 300,
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          decoration: InputDecoration(
             counterText: "",
              prefixIcon: Icon(
                Icons.map,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Family's State",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String state) {
            if (state.isEmpty) {
              return "Please add famliy's state";
            } else {
              return null;
            }
          },
        ));

    final etFamilyZipCode = Container(
        height: 60,
        child: TextFormField(
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 300,
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          decoration: InputDecoration(
             counterText: "",
              prefixIcon: Icon(
                Icons.satellite,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Family's zip code",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String zipCode) {
            if (zipCode.isEmpty) {
              return "Please add Famliy's zip Code";
            } else {
              return null;
            }
          },
        ));

    final etFamilyWebUrl = Container(
        height: 60,
        child: TextFormField(
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 300,
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          decoration: InputDecoration(
             counterText: "",
              prefixIcon: Icon(
                Icons.web,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Family's web Url",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String webUrl) {
            if (webUrl.isEmpty) {
              return "Please add family's web url";
            } else {
              return null;
            }
          },
        ));
    final etFamilyMentor = Container(
        height: 60,
        child: TextFormField(
          cursorColor: Color.fromRGBO(64, 75, 96, .9),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          //controller: firstNameTextController,
          //validator: _validateFirstName,
          maxLength: 300,
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .9),
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          decoration: InputDecoration(
             counterText: "",
              prefixIcon: Icon(
                Icons.insert_chart,
                size: 15,
                color: Color.fromRGBO(64, 75, 96, .9),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: const OutlineInputBorder(
                  borderSide: const BorderSide(

                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: Color.fromARGB(255, 232, 232, 232),
                      color: Color.fromRGBO(64, 75, 96, .9),
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: "Family's Mentor/Coach (Optional)",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String mentor) {
            // if (password.isEmpty) {
            //   return "Please Wedding Date";
            // } else {
            //   return null;
            // }
          },
        ));

    Widget row() {
    
      return SizedBox(
      
        height: 37,
              child: Row(
                //scrollDirection: Axis.horizontal ,
          children: <Widget>[
             Container(
               height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width-200,
               
                 decoration: BoxDecoration(
            border: Border.all(color: AppColorsStyles.backgroundColour),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5))),
               
               child: Center(child: Text("${selectedDate.toLocal()}".split(' ')[0]))),
           // etWeddingDate,
           
            // SizedBox(
            //   height: 2.0,
            // ),
            Spacer(),
            RaisedButton(
              shape: RoundedRectangleBorder(
  borderRadius: new BorderRadius.circular(5.0),
  side: BorderSide(color: AppColorsStyles.backgroundColour)
),
              color: AppColorsStyles.backgroundColour,
              onPressed: () => _selectDate(context),
              child: Text('Select date',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      );
    }

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

    final submitButtom = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            //   // If the form is valid, display a Snackbar.
            //  Scaffold.of(context).showSnackBar(snackBar);
            //   Navigator.push(
            //   context,
            //  // MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
          }
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(64, 75, 96, .9),
        child: Text('Submit', style: TextStyle(color: Colors.white)),
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
        appBar: AppBar(
            title: Text("Add a new Famliy"),
            backgroundColor: AppColorsStyles.backgroundColour),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 15,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    children: <Widget>[
                      // X1Demo(),
                      // Text('happy birthday login),
                       logo,
                       SizedBox(height: 0.0),
                      etFamilyName,
                      SizedBox(height: 0.0),
                      row(),
                      //               ListView(
                      //                 itemExtent: 2,
                      //  scrollDirection: Axis.horizontal,
                      //   children: <Widget>[
                      //     Text("${selectedDate.toLocal()}".split(' ')[0]),
                      //     SizedBox(height: 2.0,),
                      //     RaisedButton(
                      //       onPressed: () => _selectDate(context),
                      //       child: Text('Select date'),
                      //     ),
                      //   ],
                      //  ),

                     //   etWeddingDate,
                      SizedBox(height: 10.0),
                      etFamilyStreetAddress,
                      SizedBox(height: 0.0),
                      etFamilyCity,
                      SizedBox(height: 0.0),
                      etFamilyState,
                      SizedBox(height: 0.0),
                      etFamilyZipCode,
                      SizedBox(height: 0.0),
                      etFamilyWebUrl,
                      SizedBox(height: 0.0),
                      etFamilyMentor,
                      SizedBox(height: 0.0),
                      submitButtom,
                      //backtext
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        etDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }
}
