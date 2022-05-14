import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/ThemeHelper.dart';
import 'package:hospitel/component/alert.dart';
import 'package:hospitel/component/loading.dart';
import 'package:hospitel/login/forgotPassword.dart';
import 'package:hospitel/login/register.dart';
import 'package:hospitel/mainboard/dashboard.dart';
import 'package:hospitel/services/loginService.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? LoadingFoldingCube()
        : Material(
            child: Scaffold(
              backgroundColor: ColorBackground,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.10),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "ยินดีต้อนรับ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Opun',
                            fontSize: 35),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Image.asset("assets/images/logo.png", height: 300),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        child: TextFormField(
                          controller: email,
                          style: TextStyle(color: Colors.black),
                          decoration:
                              ThemeHelper().textInputDecoration("อีเมล"),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        child: TextFormField(
                          obscureText: true,
                          controller: password,
                          style: TextStyle(color: Colors.black),
                          decoration:
                              ThemeHelper().textInputDecoration("รหัสผ่าน"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.14,
                        ),
                        Text(
                          "หากคุณยังไม่มีบัญชี ?",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Opun',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Register()),
                                (route) => false);
                          },
                          child: Text(
                            "สมัครสมาชิก",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Opun',
                              color: Colors.deepOrange[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => forgotPassword()),
                              (route) => false);
                        },
                        child: Text(
                          "ลืมรหัสผ่าน ?",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Opun',
                            color: Colors.red[400],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FlatButton(
                        onPressed: () async {
                          if (email.text == "") {
                            showDialog(
                              context: context,
                              builder: (_) => AlertMessage(
                                  "แจ้งเตือน", "กรุณากรอกอีเมล์", null),
                            );
                          } else {
                            if (password.text == "") {
                              showDialog(
                                context: context,
                                builder: (_) => AlertMessage(
                                    "แจ้งเตือน", "กรุณากรอกรหัสผ่าน", null),
                              );
                            } else {
                              setState(() => loading = true);
                              final result =
                                  await Login(email.text, password.text);
                              setState(() => loading = false);
                              if (result.email != "") {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => dashboardScreen(
                                            result.token,
                                            result.fullname,
                                            result.email,
                                            0)),
                                    (route) => false);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertMessage(
                                      "แจ้งเตือน", "รหัสผ่านไม่ถูกต้อง", null),
                                );
                              }
                            }
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: ColorBGText,
                        padding: EdgeInsets.only(left: 80, right: 80),
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            fontFamily: 'Opun',
                            color: Colors.black,
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
