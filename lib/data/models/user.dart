class User {
  String userId;
  String userName;
  String userSurname;
  String userMail;
  String userPhone;
  String userLogin;
  String userPassword;
  String userToken;

  User(
      {this.userId,
      this.userName,
      this.userSurname,
      this.userMail,
      this.userPhone,
      this.userLogin,
      this.userPassword,
      this.userToken});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userSurname = json['userSurname'];
    userMail = json['userMail'];
    userPhone = json['userPhone'];
    userLogin = json['userLogin'];
    userPassword = json['userPassword'];
    userToken = json['userToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userSurname'] = this.userSurname;
    data['userMail'] = this.userMail;
    data['userPhone'] = this.userPhone;
    data['userLogin'] = this.userLogin;
    data['userPassword'] = this.userPassword;
    data['userToken'] = this.userToken;
    return data;
  }
}
