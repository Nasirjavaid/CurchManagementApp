class User {
  String id;
  int churchId;
  String smtpServer;
  String smtpUser;
  String smtpPassword;
  int smtpPort;

  User(
      {this.id,
      this.churchId,
      this.smtpServer,
      this.smtpUser,
      this.smtpPassword,
      this.smtpPort});

  User.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    churchId = json['church_id'];
    smtpServer = json['smtp_server'];
    smtpUser = json['smtp_user'];
    smtpPassword = json['smtp_password'];
    smtpPort = json['smtp_port'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['church_id'] = this.churchId;
    data['smtp_server'] = this.smtpServer;
    data['smtp_user'] = this.smtpUser;
    data['smtp_password'] = this.smtpPassword;
    data['smtp_port'] = this.smtpPort;
    return data;
  }
}