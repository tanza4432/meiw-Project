import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  Account({
    this.token,
    this.fullname,
    this.email,
    this.password,
  });

  String token;
  String fullname;
  String email;
  String password;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        token: json["token"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "fullname": fullname,
        "email": email,
        "password": password,
      };
}
