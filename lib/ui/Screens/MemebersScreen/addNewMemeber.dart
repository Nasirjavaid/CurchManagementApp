import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Models/member.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:jamaithius_family/Services/memberService.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/config/methods.dart';
import 'package:jamaithius_family/ui/Common/commonWidgets.dart';

class AddNewMemeber extends StatefulWidget {
  int familyId;
  Family family;
  bool isEditing;
  Member editingMemberModel;
  AddNewMemeber(
      {this.familyId, this.isEditing, this.editingMemberModel, this.family});

  @override
  _AddNewMemeberState createState() => _AddNewMemeberState();
}

class _AddNewMemeberState extends State<AddNewMemeber> {
  bool dateEdinting = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController etFirstNameController = TextEditingController();
  TextEditingController etLastNameController = TextEditingController();
  TextEditingController etSalutationController = TextEditingController();
  TextEditingController etAddress1Controller = TextEditingController();
  TextEditingController etAddress2Controller = TextEditingController();
  TextEditingController etCityController = TextEditingController();
  TextEditingController etStateController = TextEditingController();
  TextEditingController etZipCodeController = TextEditingController();
  TextEditingController etDayPhoneController = TextEditingController();
  TextEditingController etEveningPhoneController = TextEditingController();
  TextEditingController etMobilePhoneController = TextEditingController();
  TextEditingController etEmailController = TextEditingController();
  TextEditingController etWebUrlController = TextEditingController();

  MemberService get memberService => GetIt.I<MemberService>();
  APIResponce<bool> apiResponce;

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  String dropDownCurrentValue;

  bool memebrMobilePhonePermission = true;
  bool isLoading = false;

  List<String> memeberRelationShipTypesDropdownItems = [
    'Brother',
    'Sister',
    'Mother',
    'Father',
    'Wife',
    'Husband'
  ];

  @override
  void initState() {
    if (widget.isEditing) {
      memberEditingFunction();
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

  Future<bool> insertOrUpdateFamilyMmeber() async {
    setState(() {
      isLoading = true;
    });
    // //Family model
    // Family family = new Family();
    Member member = Member();

    if (widget.isEditing) {
      member.memberId = widget.editingMemberModel.memberId;
      member.familyId = widget.family.familyId;
      print(
          "Member updated.....#############   with familyId ${widget.family.familyName}");
    } else {
      member.memberId = 0;
      member.familyId = widget.familyId;

      print("family id received in add new member ${widget.familyId}");
      print("New family member added......");
    }

    member.churchId = 1;
    member.firstName = etFirstNameController.text;
    member.lastName = etLastNameController.text;
    member.address1 = etAddress1Controller.text;
    member.address2 = etAddress2Controller.text;
    member.city = etCityController.text;
    member.state = etStateController.text;
    member.zipCode = etZipCodeController.text;
    member.dayPhone = etDayPhoneController.text;
    member.eveningPhone = etEveningPhoneController.text;
    member.mobilePhone = etMobilePhoneController.text;
    member.email = etEmailController.text;
    member.weburl = etWebUrlController.text;
    member.dob = selectedDate.toString();
    member.membershipNo = "23";
    member.isMember = true;
    member.salutation = etSalutationController.text;
    member.relationShipId = 3;

    member.donotcall = memebrMobilePhonePermission;

    apiResponce = await memberService.insertOrUpdateFamilyMember(member);

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
        etFirstNameController.text = "";
        member.lastName = etLastNameController.text = "";
        member.address1 = etAddress1Controller.text = "";
        member.address2 = etAddress2Controller.text = "";
        member.city = etCityController.text = "";
        member.state = etStateController.text = "";
        member.zipCode = etZipCodeController.text = "";
        member.dayPhone = etDayPhoneController.text = "";
        member.eveningPhone = etEveningPhoneController.text = "";
        member.mobilePhone = etMobilePhoneController.text = "";
        member.email = etEmailController.text = "";
        member.weburl = etWebUrlController.text = "";
        member.salutation = etSalutationController.text = "";
      });

      if (widget.isEditing) {
        showMessageSuccess("Member Updated");
      } else {
        showMessageSuccess("Member added");
      }

      return true;
    }

    print(
        "Api responce in Insert or update  Family member Form : ${apiResponce.data}");
    return false;
  }

  memberEditingFunction() {
    setState(() {
      etFirstNameController.text = widget.editingMemberModel.firstName;
      etLastNameController.text = widget.editingMemberModel.lastName;
      etAddress1Controller.text = widget.editingMemberModel.address1;
      etAddress2Controller.text = widget.editingMemberModel.address2;
      etCityController.text = widget.editingMemberModel.city;
      etStateController.text = widget.editingMemberModel.state;
      etZipCodeController.text = widget.editingMemberModel.zipCode;
      etDayPhoneController.text = widget.editingMemberModel.dayPhone;
      etEveningPhoneController.text = widget.editingMemberModel.eveningPhone;
      etMobilePhoneController.text = widget.editingMemberModel.mobilePhone;
      etEmailController.text = widget.editingMemberModel.email;
      etWebUrlController.text = widget.editingMemberModel.weburl;
      etSalutationController.text = widget.editingMemberModel.salutation;
      memebrMobilePhonePermission = widget.editingMemberModel.donotcall;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("family id received :${widget.familyId}");
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: widget.isEditing
              ? Text("Update memeber")
              : Text("Add a new memeber"),
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
                  etFieldStreetAddress1(),
                  SizedBox(height: 6.0),
                  etFieldStreetAddress2(),
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

                  Container(
                      child: isLoading
                          ? CommonWidgets.progressIndicatorBlue
                          : submitButtom()),

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
        dateEdinting = true;
        selectedDate = picked;
        // etDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  Widget logo() {
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
      controller: etFirstNameController,
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
      controller: etLastNameController,
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
      controller: etSalutationController,
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
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
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

  Widget etFieldStreetAddress1() {
    return TextFormField(
      controller: etAddress1Controller,
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
          hintText: "Street address 1",
          labelText: "Street address 1",
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

  Widget etFieldStreetAddress2() {
    return TextFormField(
      controller: etAddress2Controller,
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
          hintText: "Street address 2",
          labelText: "Street address 2",
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
      controller: etCityController,
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
      controller: etStateController,
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
      controller: etZipCodeController,
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
                print("call permission : $memebrMobilePhonePermission ");
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
      controller: etDayPhoneController,
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
      controller: etEveningPhoneController,
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
      controller: etMobilePhoneController,
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
      controller: etEmailController,
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
      controller: etWebUrlController,
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
                  child: widget.isEditing &&
                          widget.editingMemberModel.dob != null &&
                          dateEdinting == false
                      ? Text(
                          "${DateTimeConverter.getDateAndTime(widget.editingMemberModel.dob)}",
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
              // side: BorderSide(color: AppColorsStyles.backgroundColour)
            ),
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

  Widget submitButtom() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
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
            insertOrUpdateFamilyMmeber();
          }
        },
        padding: EdgeInsets.all(12),
        color: AppColorsStyles.backgroundColour,
        child: Text('Submit', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
