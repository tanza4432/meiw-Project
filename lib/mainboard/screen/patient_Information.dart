import 'package:flutter/material.dart';

class patient_Information extends StatefulWidget {
  @override
  State<patient_Information> createState() => _patient_InformationState();
}

class _patient_InformationState extends State<patient_Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          "ข้อมูลผู้ป่วย",
          style: TextStyle(fontFamily: 'Opun'),
        ),
      )),
      body: Container(),
    );
  }
}
