import 'package:flutter/material.dart';

class patient_notification extends StatefulWidget {
  @override
  State<patient_notification> createState() => _patient_notificationState();
}

class _patient_notificationState extends State<patient_notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          "แจ้งเตือนผู้ป่วยมีอาการ",
          style: TextStyle(fontFamily: 'Opun'),
        ),
      )),
      body: Container(),
    );
  }
}
