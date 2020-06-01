class Member {
  int id;
  int familyId;
  int memberId;
  int churchId;
  int relationShipId;
  String firstName;
  String lastName;
  String address1;
  String address2;
  String city;
  String state;
  String zipCode;
  String dayPhone;
  String eveningPhone;
  String mobilePhone;
  String email;
  String weburl;
  String dob;
  String membershipNo;
  String salutation;
  bool isMember;
  bool donotemail;
  String lastvisiteddate;
  String lastattendeddate;
  String createddate;
  String modifieddate;
  int coachId;
  String lastcalleddate;
  bool donotcall;

  Member(
      {this.id,
      this.familyId,
      this.memberId,
      this.churchId,
      this.relationShipId,
      this.firstName,
      this.lastName,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.zipCode,
      this.dayPhone,
      this.eveningPhone,
      this.mobilePhone,
      this.email,
      this.weburl,
      this.dob,
      this.membershipNo,
      this.salutation,
      this.isMember,
      this.donotemail,
      this.lastvisiteddate,
      this.lastattendeddate,
      this.createddate,
      this.modifieddate,
      this.coachId,
      this.lastcalleddate,
      this.donotcall});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    familyId =json['familyID'];
    memberId = json['member_id'];
    churchId = json['church_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    dayPhone = json['day_phone'];
    eveningPhone = json['evening_phone'];
    mobilePhone = json['mobile_phone'];
    email = json['email'];
    weburl = json['weburl'];
    dob = json['dob'];
    membershipNo = json['membership_no'];
    salutation = json['salutation'];
    donotemail = json['donotemail'];
    lastvisiteddate = json['lastvisiteddate'];
    lastattendeddate = json['lastattendeddate'];
    createddate = json['createddate'];
    modifieddate = json['modifieddate'];
    coachId = json['coach_id'];
    lastcalleddate = json['lastcalleddate'];
    donotcall = json['donotcall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['member_id'] = this.memberId;
    data['church_id'] = this.churchId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['day_phone'] = this.dayPhone;
    data['evening_phone'] = this.eveningPhone;
    data['mobile_phone'] = this.mobilePhone;
    data['email'] = this.email;
    data['weburl'] = this.weburl;
    data['dob'] = this.dob;
    data['membership_no'] = this.membershipNo;
    data['salutation'] = this.salutation;
    data['donotemail'] = this.donotemail;
    data['lastvisiteddate'] = this.lastvisiteddate;
    data['lastattendeddate'] = this.lastattendeddate;
    data['createddate'] = this.createddate;
    data['modifieddate'] = this.modifieddate;
    data['coach_id'] = this.coachId;
    data['lastcalleddate'] = this.lastcalleddate;
    data['donotcall'] = this.donotcall;
    return data;
  }
}