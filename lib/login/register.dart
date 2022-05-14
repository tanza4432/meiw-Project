import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/ThemeHelper.dart';
import 'package:hospitel/component/alert.dart';
import 'package:hospitel/component/loading.dart';
import 'package:hospitel/login/login.dart';
import 'package:hospitel/services/loginService.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();

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
                    SizedBox(height: size.height * 0.07),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "สมัครสมาชิก",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Opun',
                                fontSize: 35),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(width: 30),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => login()),
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
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, top: 20),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "ข้อมูลผู้ป่วย",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Opun',
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Form(
                            child: TextFormField(
                              controller: fullname,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Opun'),
                              decoration: ThemeHelper()
                                  .textInputDecoration("ชื่อ - สกุล"),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Form(
                            child: TextFormField(
                              controller: email,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Opun'),
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
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Opun'),
                              decoration:
                                  ThemeHelper().textInputDecoration("รหัสผ่าน"),
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
                              controller: confirmpassword,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Opun'),
                              decoration: ThemeHelper()
                                  .textInputDecoration("ยืนยันรหัสผ่าน"),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: FlatButton(
                            onPressed: () async {
                              if (fullname.text == "") {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertMessage("แจ้งเตือน",
                                            "กรุณากรอกชื่อ-สกุล", null));
                              } else {
                                if (email.text == "") {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertMessage("แจ้งเตือน",
                                              "กรุณากรอกอีเมล์", null));
                                } else {
                                  if (password.text == "" ||
                                      confirmpassword.text == "") {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertMessage("แจ้งเตือน",
                                                "กรุณากรอกรหัสผ่าน", null));
                                  } else {
                                    if (password.text != confirmpassword.text) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertMessage(
                                                  "แจ้งเตือน",
                                                  "กรุณากรอกรหัสผ่านให้ตรงกัน",
                                                  null));
                                    } else {
                                      setState(() => loading = true);
                                      final String result =
                                          await RegisterAccount(fullname.text,
                                              email.text, password.text);
                                      setState(() => loading = false);
                                      if (result == "เพิ่มบัญชีสำเร็จ") {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertMessage(
                                              "แจ้งเตือน",
                                              "สมัครสมาชิกเรียบร้อยแล้ว",
                                              login()),
                                        );
                                      }
                                    }
                                  }
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.greenAccent[400],
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "ยืนยัน",
                              style: TextStyle(
                                fontFamily: 'Opun',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
