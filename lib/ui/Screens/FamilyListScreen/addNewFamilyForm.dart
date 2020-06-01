import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:jamaithius_family/Services/familyService.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';
import 'package:jamaithius_family/ui/Common/commonWidgets.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/addNewMemeber.dart';

class AddNewFamilyForm extends StatefulWidget {
  bool isEditing;
  Family familyEditingModel;
  AddNewFamilyForm({this.isEditing, this.familyEditingModel});
  @override
  _AddnewFamilyFormState createState() => new _AddnewFamilyFormState();
}

class _AddnewFamilyFormState extends State<AddNewFamilyForm> {
  //date time
  DateTime selectedDate = DateTime.now();

  //Text Editing Controllers
  TextEditingController etDateController = TextEditingController();
  TextEditingController etFamilyNameController = TextEditingController();
  TextEditingController etFamilyHomePhoneController = TextEditingController();
  TextEditingController etFamilyEmialController = TextEditingController();
  TextEditingController etFamilyStreetAddressController =
      TextEditingController();
  TextEditingController etfamilyCityController = TextEditingController();
  TextEditingController etFamilyStateController = TextEditingController();
  TextEditingController etFamilyZipCodeController = TextEditingController();
  TextEditingController etFamilyWebUrlController = TextEditingController();
  TextEditingController etFamilyMentorController = TextEditingController();

  //Api responce
  APIResponce<int> apiResponce;
  bool isLoading = false;
  bool dateEdinting = false;

  FamilyService get familyService => GetIt.I<FamilyService>();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (widget.isEditing) {
      editFamilyInitFunction(widget.familyEditingModel);
    }
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

  Future<bool> insertFamily() async {
    setState(() {
      isLoading = true;
    });
    //Family model
    Family family = new Family();

    if (widget.isEditing) {
      family.familyId = widget.familyEditingModel.familyId;
      print("Family updated.....#############");
    } else {
      family.familyId = 0;
      print("New family added......");
    }

    family.churchId = 1;
    family.familyName = etFamilyNameController.text;
    family.homePhone = etFamilyHomePhoneController.text;
    family.email = etFamilyEmialController.text;
    family.weddingDate = selectedDate.toString();
    family.address1 = etFamilyStreetAddressController.text;
    family.address2 = "";
    family.city = etfamilyCityController.text;
    family.state = etFamilyStateController.text;
    family.zipCode = etFamilyZipCodeController.text;
    family.weburl = etFamilyWebUrlController.text;

    apiResponce = await familyService.insertFamily(family);

    if (apiResponce == null) {
      setState(() {
        isLoading = false;
        return false;
      });

      showMessageError("Something went wrong");
    }

    if (apiResponce != null) {
      setState(() {
        isLoading = false;

        etFamilyNameController.text = "";
        etFamilyHomePhoneController.text = "";
        etFamilyEmialController.text = "";

        etFamilyStreetAddressController.text = "";

        etfamilyCityController.text = "";
        etFamilyStateController.text = "";
        etFamilyZipCodeController.text = "";
        etFamilyWebUrlController.text = "";
        etFamilyMentorController.text ="";
      });

   if(widget.isEditing)
   {
   showMessageSuccess("Family updated");
   }else{
        showMessageSuccess("Family added");
   }

      return true;
    }

    print("Api responce in Insert Family Form : ${apiResponce.data}");
    // return false;
  }

  editFamilyInitFunction(Family family) {
    etFamilyNameController.text = family.familyName;
    etFamilyHomePhoneController.text = family.homePhone;
    etFamilyEmialController.text = family.email;
    etFamilyStreetAddressController.text = family.address1;

    //address2 is not available yet
    //etFamilyStreetAddressController.text =family.address2;
    etfamilyCityController.text = family.city;
    etFamilyStateController.text = family.state;
    etFamilyZipCodeController.text = family.zipCode;
    etFamilyWebUrlController.text = family.weburl;
    etFamilyMentorController.text = family.coachId.toString();
  }

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
          controller: etFamilyNameController,
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

    final etfamilyHomePhone = Container(
        height: 60,
        child: TextFormField(
          controller: etFamilyHomePhoneController,
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
              // prefixIcon: Icon(
              //   Icons.people,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              hintText: "Home phone",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              labelText: "Home phone",
              filled: true,
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String familyname) {
            if (familyname.isEmpty) {
              return "Please Add Family Home Phone";
            } else {
              return null;
            }
          },
        ));

    final etFamilyEmail = Container(
        height: 60,
        child: TextFormField(
          controller: etFamilyEmialController,
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
              // prefixIcon: Icon(
              //   Icons.people,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              hintText: "Family email",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(64, 75, 96, .9),
                //fontFamily: ScreensFontFamlty.FONT_FAMILTY
              ),
              filled: true,
              labelText: "Family email",
              fillColor: Colors.white,
              errorStyle:
                  TextStyle(color: Colors.red, fontStyle: FontStyle.italic)),
          validator: (String familyname) {
            if (familyname.isEmpty) {
              return "Please Add Family Email";
            } else {
              return null;
            }
          },
        ));

    final etFamilyStreetAddress = Container(
        height: 60,
        child: TextFormField(
          controller: etFamilyStreetAddressController,
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
              // prefixIcon: Icon(
              //   Icons.location_city,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              labelText: "Family's street address",
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
          controller: etfamilyCityController,
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
              // prefixIcon: Icon(
              //   Icons.location_on,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              labelText: "Family's city",
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
          controller: etFamilyStateController,
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
              // prefixIcon: Icon(
              //   Icons.map,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              labelText: "Family's State",
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
          controller: etFamilyZipCodeController,
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
              // prefixIcon: Icon(
              //   Icons.satellite,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              labelText: "Family's zip code",
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
          controller: etFamilyWebUrlController,
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
              // prefixIcon: Icon(
              //   Icons.web,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              labelText: "Family's web Url",
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
          controller: etFamilyMentorController,
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
              // prefixIcon: Icon(
              //   Icons.insert_chart,
              //   size: 15,
              //   color: Color.fromRGBO(64, 75, 96, .9),
              // ),
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
              labelText: "Family's Mentor/Coach (Optional)",
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
                    child: widget.isEditing &&
                            widget.familyEditingModel.weddingDate != null &&
                            dateEdinting == false
                        ? Text(
                            "${DateTimeConverter.getDateAndTime(widget.familyEditingModel.weddingDate)}",
                          )
                        : Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                          ))),
            // etWeddingDate,

            // SizedBox(
            //   height: 2.0,
            // ),
            Spacer(),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  side: BorderSide(color: AppColorsStyles.backgroundColour)),
              color: AppColorsStyles.backgroundColour,
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
            // netWorkChek();

            NetworkConnectivity.check().then((internet) async {
              bool userAuth = await insertFamily();

              print("returned value : $userAuth");
              if (internet) {
                if (userAuth) {
                  Future.delayed(const Duration(milliseconds: 1500), () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(pageBuilder: (BuildContext context,
                            Animation animation, Animation secondaryAnimation) {
                          return AddNewMemeber(familyId: apiResponce.data,isEditing: false,);
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
                        }));
                  });
                } else {
                  showMessageError("Something went wrong");

                  setState(() {
                    isLoading = false;
                  });
                }
              } else {
                //show network erro
                showMessageError("Network is not avalable");
              }
            });
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
        key: _scaffoldKey,
        appBar: AppBar(
            title: widget.isEditing
                ? Text("Update Famliy")
                : Text("Add a new Famliy"),
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
                      etfamilyHomePhone,
                      etFamilyEmail,
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
                      Container(
                          child: isLoading
                              ? CommonWidgets.progressIndicatorBlue
                              : submitButtom),
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
        dateEdinting = true;
        selectedDate = picked;
        etDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }
}
