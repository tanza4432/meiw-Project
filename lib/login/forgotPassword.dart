import 'package:flutter/material.dart';
import 'package:hospitel/Controller/ForgotController.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/ThemeHelper.dart';
import 'package:hospitel/component/alert.dart';
import 'package:hospitel/component/loading.dart';
import 'package:hospitel/login/login.dart';
import 'package:hospitel/login/register.dart';
import 'package:hospitel/services/loginService.dart';

class forgotPassword extends StatefulWidget {
  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController email = new TextEditingController();
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
                        "Alarm System",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Opun',
                            fontSize: 35),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "ลืมรหัสผ่าน",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[400],
                            fontFamily: 'Opun',
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        child: TextFormField(
                          controller: email,
                          style: TextStyle(color: Colors.black),
                          decoration:
                              ThemeHelper().textInputDecoration("กรอกอีเมล"),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
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
                            color: Colors.black,
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
                              MaterialPageRoute(builder: (context) => login()),
                              (route) => false);
                        },
                        child: Text(
                          "ลงชื่อเข้าใช้",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Opun',
                            color: Colors.deepOrange[400],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FlatButton(
                        onPressed: () async {
                          if (email.text != "") {
                            setState(() => loading = true);
                            Forgotpassword(context, email.text);
                          } else {
                            setState(() => loading = false);
                            showDialog(
                              context: context,
                              builder: (_) => AlertMessage(
                                  "แจ้งเตือน", "กรุณากรอกอีเมล", null),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: ColorBackground,
                        padding: EdgeInsets.only(left: 80, right: 80),
                        child: Text(
                          "Continue",
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
