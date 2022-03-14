import 'package:flutter/material.dart';
import 'package:hospitel/login/login.dart';
import 'package:hospitel/login/register.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: size.height * 0.4),
                Text(
                  "Alarm system",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blue,
                        offset: Offset(0.5, 5.0),
                      ),
                    ],
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.25),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Register()),
                          (route) => false);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Color(0xFF41aad1),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "เริ่มต้นใช้งาน",
                      style: TextStyle(
                        fontFamily: 'Opun',
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "หากคุณมีบัญชีแล้ว",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Opun',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => login()),
                            (route) => false);
                      },
                      child: Text(
                        "ลงชื่อเข้าใช้",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Opun',
                          color: Colors.deepOrange[400],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
