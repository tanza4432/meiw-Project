// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:hospitel/model/usermodel.dart';
import 'package:http/http.dart' as http;

Future<UserModel> Login() async {
  final String url = "http://localhost:1412/api/login/alarm2/12345678";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return UserModel.fromJson(jsonDecode(response.body));
}
