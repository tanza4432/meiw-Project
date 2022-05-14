import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/Fade_Animation.dart';
import 'package:hospitel/component/alert.dart';
import 'package:hospitel/component/loading.dart';
import 'package:hospitel/login/login.dart';
import 'package:hospitel/mainboard/dashboard.dart';
import 'dart:io';

import 'package:hospitel/services/loginService.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage(this.token, this.fullname, this.email);
  String token;
  String fullname;
  String email;

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TextEditingController fullnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();
  File file;

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    fullnameController.text = widget.fullname;
    emailController.text = widget.email;
    return loading
        ? LoadingFoldingCube()
        : new Scaffold(
            body: new Container(
            color: Colors.white,
            child: new ListView(
              children: <Widget>[
                FadeAnimation(
                  1.0,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 50),
                        Text(
                          "ข้อมูลส่วนตัว",
                          style: TextStyle(
                              fontSize: 22,
                              color: ColorBackground,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Opun'),
                        ),
                        IconButton(
                          iconSize: 35,
                          color: ColorBackground,
                          icon: const Icon(Icons.exit_to_app_rounded),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => login()),
                                (route) => false);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                  1.0,
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 10.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'แก้ไขข้อมูล',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: ColorBackground,
                                                fontFamily: 'Opun',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          _status
                                              ? _getEditIcon()
                                              : new Container(),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'ชื่อ',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: ColorBackground,
                                                fontFamily: 'Opun',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                        child: TextField(
                                      controller: fullnameController,
                                      decoration: const InputDecoration(
                                        hintText: "ใส่ชื่อของคุณ",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'อีเมล',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: ColorBackground,
                                                fontFamily: 'Opun',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                          child: TextField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                            hintText: "ป้อน ID อีเมล"),
                                        enabled: false,
                                        autofocus: !_status,
                                      )),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'ตั้งรหัสผ่านใหม่',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: ColorBackground,
                                                fontFamily: 'Opun',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: new TextField(
                                          obscureText: true,
                                          controller: passwordController,
                                          decoration: const InputDecoration(
                                              hintText: "ตั้งรหัสผ่านใหม่"),
                                          enabled: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'ยืนยัน ตั้งรหัสผ่านใหม่',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: ColorBackground,
                                                fontFamily: 'Opun',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: new TextField(
                                          obscureText: true,
                                          controller: confirmpasswordController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "ยืนยันตั้งรหัสผ่านใหม่"),
                                          enabled: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 15.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[],
                                  )),
                              !_status ? _getActionButtons() : new Container(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text(
                  "บันทึก",
                  style: TextStyle(
                    fontFamily: 'Opun',
                  ),
                ),
                textColor: Colors.white,
                color: Color(0xFF33CC33),
                onPressed: () async {
                  setState(() => loading = true);
                  if (passwordController?.text != "") {
                    if (passwordController?.text ==
                        confirmpasswordController.text) {
                      var changepassword = md5
                          .convert(utf8.encode(passwordController?.text))
                          .toString();
                      final String status = await UpdatePassword(
                        widget.token,
                        fullnameController?.text,
                        changepassword,
                      );
                      setState(() => loading = false);
                      if (status == "แก้ไขข้อมูลแล้ว") {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน",
                                "แก้ไขข้อมูลสำเร็จ",
                                dashboardScreen(
                                    widget.token,
                                    fullnameController.text,
                                    emailController.text,
                                    2)));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน",
                                "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                                null));
                      }
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "กรอกกรหัสให้ตรงกัน", null));
                    }
                  } else {
                    final String status = await UpdateProfile(
                        widget.token, fullnameController.text);
                    setState(() => loading = false);
                    if (status == "แก้ไขข้อมูลแล้ว") {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "แก้ไขข้อมูลสำเร็จ",
                              dashboardScreen(
                                  widget.token,
                                  fullnameController.text,
                                  emailController.text,
                                  2)));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                              null));
                    }
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("ยกเลิก",
                    style: TextStyle(
                      fontFamily: 'Opun',
                    )),
                textColor: Colors.white,
                color: Colors.red[600],
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: ColorBackground,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
