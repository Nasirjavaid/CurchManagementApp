class Family {
  String id;
  int familyId;
  int churchId;
  String familyName;
  String address1;
  String address2;
  String city;
  String state;
  String zipCode;
  String homePhone;
  String email;
  String weburl;
  String weddingDate;
  int coachId;
  String createddate;
  String modifieddate;

  Family(
      {this.id,
      this.familyId,
      this.churchId,
      this.familyName,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.zipCode,
      this.homePhone,
      this.email,
      this.weburl,
      this.weddingDate,
      this.coachId,
      this.createddate,
      this.modifieddate});

  Family.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    familyId = json['family_id'];
    churchId = json['church_id'];
    familyName = json['family_name'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    homePhone = json['home_phone'];
    email = json['email'];
    weburl = json['weburl'];
    weddingDate = json['wedding_date'];
    coachId = json['coach_id'];
    createddate = json['createddate'];
    modifieddate = json['modifieddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['family_id'] = this.familyId;
    data['church_id'] = this.churchId;
    data['family_name'] = this.familyName;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['home_phone'] = this.homePhone;
    data['email'] = this.email;
    data['weburl'] = this.weburl;
    data['wedding_date'] = this.weddingDate;
    data['coach_id'] = this.coachId;
    data['createddate'] = this.createddate;
    data['modifieddate'] = this.modifieddate;
    return data;
  }
}