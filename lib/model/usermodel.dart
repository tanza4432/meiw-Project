// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.phoneFamily,
    this.address,
    this.password,
    this.name,
    this.type,
    this.phone,
    this.addressFamily,
    this.lasnameFamily,
    this.username,
    this.nameFamily,
  });

  String phoneFamily;
  String address;
  String password;
  String name;
  String type;
  String phone;
  String addressFamily;
  String lasnameFamily;
  String username;
  String nameFamily;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        phoneFamily: json["PhoneFamily"],
        address: json["Address"],
        password: json["Password"],
        name: json["Name"],
        type: json["Type"],
        phone: json["Phone"],
        addressFamily: json["AddressFamily"],
        lasnameFamily: json["LasnameFamily"],
        username: json["Username"],
        nameFamily: json["NameFamily"],
      );

  Map<String, dynamic> toJson() => {
        "PhoneFamily": phoneFamily,
        "Address": address,
        "Password": password,
        "Name": name,
        "Type": type,
        "Phone": phone,
        "AddressFamily": addressFamily,
        "LasnameFamily": lasnameFamily,
        "Username": username,
        "NameFamily": nameFamily,
      };
}
