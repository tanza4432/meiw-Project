import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/ThemeHelper.dart';
import 'package:hospitel/login/login.dart';
import 'package:hospitel/login/typeRegister/hospital.dart';
import 'package:hospitel/login/typeRegister/patient.dart';
import 'package:hospitel/login/typeRegister/relative.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String defaultValue = 'กรุณาเลือกประเภท';

  var type = ['กรุณาเลือกประเภท', 'ผู้ป่วย', 'ญาติ'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
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
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, top: 20),
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
                        // controller: username,
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Opun'),
                        decoration:
                            ThemeHelper().textInputDecoration("ชื่อ - สกุล"),
                      ),
                    ),
                  ),
                  // SizedBox(height: size.height * 0.02),
                  // Container(
                  //   alignment: Alignment.center,
                  //   margin: EdgeInsets.symmetric(horizontal: 40),
                  //   child: Form(
                  //     child: TextFormField(
                  //       // controller: username,
                  //       style: TextStyle(color: Colors.black),
                  //       decoration:
                  //           ThemeHelper().textInputDecoration("ที่อยู่"),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: size.height * 0.02),
                  // Container(
                  //   alignment: Alignment.center,
                  //   margin: EdgeInsets.symmetric(horizontal: 40),
                  //   child: Form(
                  //     child: TextFormField(
                  //       // controller: username,
                  //       style: TextStyle(color: Colors.black),
                  //       decoration:
                  //           ThemeHelper().textInputDecoration("เบอร์โทรศัพท์"),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      child: TextFormField(
                        // controller: username,
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Opun'),
                        decoration: ThemeHelper().textInputDecoration("อีเมล"),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      child: TextFormField(
                        // controller: username,
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Opun'),
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
                        // controller: username,
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Opun'),
                        decoration:
                            ThemeHelper().textInputDecoration("ยืนยันรหัสผ่าน"),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FlatButton(
                      onPressed: () {
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(builder: (context) => Register()),
                        //     (route) => false);
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "ประเภท : ",
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //           fontFamily: 'Opun',
              //           fontSize: 20),
              //     ),
              //     DropdownButton(
              //       value: defaultValue,
              //       icon: const Icon(Icons.keyboard_arrow_down),
              //       items: type.map((String items) {
              //         return DropdownMenuItem(
              //           value: items,
              //           child: Text(
              //             items,
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black,
              //                 fontFamily: 'Opun',
              //                 fontSize: 20),
              //           ),
              //         );
              //       }).toList(),
              //       onChanged: (String newValue) {
              //         setState(() {
              //           defaultValue = newValue;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              // defaultValue == "ผู้ป่วย" ? patient() : Container(),
              // defaultValue == "ญาติ" ? relative() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
