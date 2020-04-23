import 'package:flutter/material.dart';
import 'package:jamaithius_family/config/appConstants.dart';

class AddNewMemeber extends StatefulWidget {
  @override
  _AddNewMemeberState createState() => _AddNewMemeberState();
}

class _AddNewMemeberState extends State<AddNewMemeber> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  String dropDownCurrentValue;

  bool memebrMobilePhonePermission = false;

  List<String> memeberRelationShipTypesDropdownItems = [
    'Brother',
    'Sister',
    'Mother',
    'Father',
    'Wife',
    'Husband'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add a new memeber"),
          backgroundColor: AppColorsStyles.backgroundColour),
     // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                children: <Widget>[
          
                   logo(),
                  SizedBox(height: 6.0),
                  etFieldFirstName(),
                  SizedBox(height: 6.0),
                  etFieldLastName(),
                  SizedBox(height: 6.0),
                  etFieldSalutation(),
                  SizedBox(height: 6.0),
                  memeberRelationShipdropDownList(),
                  SizedBox(height: 6.0),
                  etFieldStreetAddress(),
                  SizedBox(height: 6.0),
                  etFieldCity(),
                  SizedBox(height: 6.0),
                  etFieldState(),
                  SizedBox(height: 6.0),
                  etFieldZipCode(),
                  SizedBox(height: 6.0),
                  memeberMobilePhonepermissionCheckBox(),
                  SizedBox(height: 6.0),
                  etFieldDayPhone(),
                  SizedBox(height: 6.0),
                  etFieldEveningPhone(),
                  SizedBox(height: 6.0),
                  etFieldMobilePhone(),
                  SizedBox(height: 6.0),
                  etFieldEmail(),
                  SizedBox(height: 6.0),
                  etFieldWebUrl(),
                  SizedBox(height: 6.0),
                  rowWithDateSelection(),
                  SizedBox(height: 6.0),
                  submitButtom()

                  //backtext
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
        // etDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  Widget logo (){

 return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50.0,
        child: Icon(
          Icons.person_add,
          color: AppColorsStyles.backgroundColour,
          size: 50.0,
        ),
      ),
    );

  }

  Widget etFieldFirstName() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "First name",
           labelText: "First name",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String firstName) {
        if (firstName.isEmpty) {
          return "Please enter first name.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldLastName() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Last name",
           labelText: "Last name",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String lastName) {
        if (lastName.isEmpty) {
          return "Please enter last name.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldSalutation() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Salutation",
           labelText: "Salutation",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String salutation) {
        if (salutation.isEmpty) {
          return "Please enter salutation.";
        } else {
          return null;
        }
      },
    );
  }

  Widget memeberRelationShipdropDownList() {
    return new Padding(
        padding: const EdgeInsets.all(0.0),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                height: 47.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                // width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: DropdownButton<String>(
                    hint: Text(
                      "Memeber realation",
                      style: TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                    underline: Text(""),
                    elevation: 0,
                    // icon: FaIcon(
                    //   FontAwesomeIcons.arrowCircleDown,
                    //   color: Colors.redAccent,
                    //   size: 35,
                    // ),
                    value: dropDownCurrentValue,
                    focusColor: Colors.redAccent,
                    items: memeberRelationShipTypesDropdownItems
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              // SizedBox(
                              //   width: 6,
                              // ),
                              // FaIcon(
                              //   FontAwesomeIcons.arrowCircleDown,
                              //   color: Colors.black54,
                              //   size: 12,
                              // ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      //TODO: must call api On change to alter the results from Map
                      setState(() {
                        dropDownCurrentValue = value;
                      });
                    },
                  ),
                ))));
  }

  Widget etFieldStreetAddress() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Street address",
           labelText: "Street address",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String address) {
        if (address.isEmpty) {
          return "Please enter address.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldCity() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "City",
           labelText: "City",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String city) {
        if (city.isEmpty) {
          return "Please enter city.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldState() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "State",
           labelText: "State",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String state) {
        if (state.isEmpty) {
          return "Please enter state.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldZipCode() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Zip code",
           labelText: "Zip Code",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String zipCode) {
        if (zipCode.isEmpty) {
          return "Please enter Zip Code.";
        } else {
          return null;
        }
      },
    );
  }

  Widget memeberMobilePhonepermissionCheckBox() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColorsStyles.backgroundColour),
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
            focusColor: Colors.white,
            value: memebrMobilePhonePermission,
            onChanged: (bool value) {
              setState(() {
                memebrMobilePhonePermission = value;
              });
            },
          ),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ),
            child: Text(
              "Memeber does not want to be called",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget etFieldDayPhone() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Day phone",
           labelText: "Day phone",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String dayPhone) {
        if (dayPhone.isEmpty) {
          return "Please enter day phone.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldEveningPhone() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Evening phone",
           labelText: "Evening phone",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String eveningPhone) {
        if (eveningPhone.isEmpty) {
          return "Please enter evening phone.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldMobilePhone() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Mobile phone",
           labelText: "Mobile phone",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String mobilePhone) {
        if (mobilePhone.isEmpty) {
          return "Please enter mobile phone.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldEmail() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Email",
           labelText: "Email",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String email) {
        if (email.isEmpty) {
          return "Please enter email.";
        } else {
          return null;
        }
      },
    );
  }

  Widget etFieldWebUrl() {
    return TextFormField(
      //cursorColor: AppColors.loginGradientStart,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 200,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
          counterText: "",
          counterStyle: TextStyle(color: Colors.white),
          // labelText: "Employee No.",
          // prefixIcon: Icon(
          //   Icons.alternate_email,
          //   size: 17,
          //   color:  AppColors.loginGradientStart,
          // ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: Color.fromARGB(255, 232, 232, 232),
                  color: AppColorsStyles.backgroundColour,
                  width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: "Web url",
          labelText: "Web url",
          hintStyle: TextStyle(
            color: Colors.black38,
            //fontFamily: ScreensFontFamlty.FONT_FAMILTY
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
      validator: (String webUrl) {
        if (webUrl.isEmpty) {
          return "Please enter web url.";
        } else {
          return null;
        }
      },
    );
  }

  Widget rowWithDateSelection() {
    return SizedBox(
      height: 37,
      child: Row(
        //scrollDirection: Axis.horizontal ,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width - 200,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColorsStyles.backgroundColour),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Center(
                  child: Text("${selectedDate.toLocal()}".split(' ')[0]))),
          // etWeddingDate,

          // SizedBox(
          //   height: 2.0,
          // ),
          Spacer(),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
               // side: BorderSide(color: AppColorsStyles.backgroundColour)
                
                ),
            color:AppColorsStyles.backgroundColour,
            onPressed: () => _selectDate(context),
            child: Text(
              'Select date',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButtom() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
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
        color: AppColorsStyles.backgroundColour,
        child: Text('Submit', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
