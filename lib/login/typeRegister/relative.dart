import 'package:flutter/material.dart';
import 'package:hospitel/component/ThemeHelper.dart';

class relative extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "ข้อมูลญาติ",
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("ชื่อ - สกุล"),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("ที่อยู่"),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("เบอร์โทรศัพท์"),
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
              style: TextStyle(color: Colors.black),
              decoration:
                  ThemeHelper().textInputDecoration("โรงพยาบาลใกล้เคียง"),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("อีเมล์"),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("รหัสผ่าน"),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("ยืนยันรหัสผ่าน"),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("ชื่อ - สกุล"),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("ที่อยู่"),
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
              style: TextStyle(color: Colors.black),
              decoration: ThemeHelper().textInputDecoration("เบอร์โทรติดต่อ"),
            ),
          ),
        ),
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
    );
  }
}
