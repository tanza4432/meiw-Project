import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
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

  var type = ['กรุณาเลือกประเภท', 'ผู้ป่วย', 'ญาติ', 'โรงพยาบาล'];

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ประเภท : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Opun',
                        fontSize: 20),
                  ),
                  DropdownButton(
                    value: defaultValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: type.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Opun',
                              fontSize: 20),
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        defaultValue = newValue;
                      });
                    },
                  ),
                ],
              ),
              defaultValue == "ผู้ป่วย" ? patient() : Container(),
              defaultValue == "ญาติ" ? relative() : Container(),
              defaultValue == "โรงพยาบาล" ? hospital() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
