import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hospitel/Controller/ForgotController.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/ThemeHelper.dart';
import 'package:hospitel/component/alert.dart';
import 'package:hospitel/component/loading.dart';
import 'package:hospitel/login/login.dart';
import 'package:hospitel/login/register.dart';
import 'package:hospitel/services/loginService.dart';

class changeForgotPassword extends StatefulWidget {
  changeForgotPassword(this.token);
  final token;
  @override
  State<changeForgotPassword> createState() => _changeForgotPasswordState();
}

class _changeForgotPasswordState extends State<changeForgotPassword> {
  TextEditingController newpassword = new TextEditingController();
  TextEditingController newpasswordconfirm = new TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? LoadingFoldingCube()
        : Material(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.10),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "ChangeNewPassword",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Opun',
                            fontSize: 30),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        child: TextFormField(
                          obscureText: true,
                          controller: newpassword,
                          style: TextStyle(color: Colors.black),
                          decoration: ThemeHelper()
                              .textInputDecoration("ตั้งรหัสผ่านใหม่"),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        child: TextFormField(
                          obscureText: true,
                          controller: newpasswordconfirm,
                          style: TextStyle(color: Colors.black),
                          decoration: ThemeHelper()
                              .textInputDecoration("ตั้งรหัสผ่านใหม่อีกครั้ง"),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FlatButton(
                        onPressed: () async {
                          if (newpassword.text != "" &&
                              newpasswordconfirm.text != "") {
                            if (newpassword.text == newpasswordconfirm.text) {
                              var changepassword = md5
                                  .convert(utf8.encode(newpassword.text))
                                  .toString();
                              setState(() => loading = true);
                              final String status = await ChangeNewPassword(
                                widget.token,
                                changepassword,
                              );
                              if (status == "แก้ไขข้อมูลแล้ว") {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertMessage("แจ้งเตือน",
                                      "เปลี่ยนรหัสผ่านสำเร็จ", login()),
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (_) => AlertMessage(
                                    "แจ้งเตือน", "กรอกรหัสผ่านไม่ตรงกัน", null),
                              );
                            }
                          } else {
                            setState(() => loading = false);
                            showDialog(
                              context: context,
                              builder: (_) => AlertMessage(
                                  "แจ้งเตือน", "กรุณากรอกให้ครบถ้วน", null),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: ColorBackground,
                        padding: EdgeInsets.only(left: 80, right: 80),
                        child: Text(
                          "ยืนยัน",
                          style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
