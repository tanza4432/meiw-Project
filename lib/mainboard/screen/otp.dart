import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospitel/component/alert.dart';
import 'package:hospitel/component/loading.dart';
import 'package:hospitel/mainboard/screen/changeForgotPassword.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailMessage extends StatefulWidget {
  EmailMessage(this.token, this.otp, this.email);
  var token;
  var otp;
  var email;
  final TextEditingController verify = TextEditingController();
  @override
  _EmailMessageState createState() => _EmailMessageState(token, otp, email);
}

class _EmailMessageState extends State<EmailMessage> {
  _EmailMessageState(this.token, this.otp, this.email);
  var token;
  var otp;
  var email;
  TextEditingController verify = TextEditingController();
  bool loading = false;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  bool cooldown = false;
  Timer timer;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  void VerifyCode(String code, String token) {
    if (otp == code) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => changeForgotPassword(token),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertMessage("แจ้งเตือน", "OTP ไม่ถูกต้อง", null),
      );
    }
  }

  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? LoadingFoldingCube()
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.025),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Verification",
                    style: TextStyle(fontFamily: 'Mochiy', fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 70),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 4) {
                            return "กรุณากรอก OTP";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 65,
                          fieldWidth: 60,
                          activeFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          setState(() => hasError = false);
                        },
                        onChanged: (value) {
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                      )),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: ButtonTheme(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        formKey.currentState.validate();
                        if (currentText.length != 4 || currentText != otp) {
                          errorController.add(ErrorAnimationType.shake);
                          setState(() => hasError = true);
                          textEditingController.clear();
                        } else {
                          setState(
                            () {
                              hasError = false;
                              VerifyCode(currentText, token);
                            },
                          );
                        }
                      },
                      child: Center(
                          child: Text(
                        "ยืนยัน".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: Offset(1, -2),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: Offset(-1, 2),
                            blurRadius: 5)
                      ]),
                ),
              ],
            ),
          );
  }
}
