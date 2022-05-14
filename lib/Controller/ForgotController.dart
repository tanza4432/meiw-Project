import 'package:flutter/material.dart';
import 'package:hospitel/component/alert.dart';
import 'package:hospitel/login/forgotPassword.dart';
import 'package:hospitel/mainboard/screen/otp.dart';
import 'package:hospitel/model/accountModel.dart';
import 'package:hospitel/services/loginService.dart';

void Forgotpassword(BuildContext context, String email) async {
  List<Account> Fetch = await GetUserAll();
  bool check = false;
  String token = "";
  for (Account data in Fetch) {
    if (data.email == email) {
      check = true;
      token = data.token;
      break;
    }
  }
  if (check == true) {
    var status = await ForgotPassword(email);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => EmailMessage(token, status, email),
      ),
    );
    showDialog(
      context: context,
      builder: (_) => AlertMessage(
          "แจ้งเตือน",
          "รหัส OTP ได้ส่งไปที่เมลผู้ใช้แล้วโปรดตรวจสอบจดหมายขาเข้าหรืออีเมลขยะ",
          null),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => forgotPassword(),
      ),
    );
    showDialog(
      context: context,
      builder: (_) => AlertMessage("แจ้งเตือน", "ไม่พบบัญชีผู้ใช้ในระบบ", null),
    );
  }
}
