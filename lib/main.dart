import 'package:flutter/material.dart';
import 'package:hospitel/mainboard/home.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// get() async {
//   var url = Uri.parse('localhost:8080');
// final http.Response response = await http.get(url,headers: <String, String>{
// ‘Content-Type: ‘’
// )) 

// If(response.statusCode = 200) {
// print(response);
// } else {
//     throw Exception(“==========“);
// }
