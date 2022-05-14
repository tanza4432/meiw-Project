import 'dart:convert';
import 'package:hospitel/model/accountModel.dart';
import 'package:hospitel/services/data.dart';
import 'package:http/http.dart' as http;

Future<Account> Login(String email, String password) async {
  final String url = Host + "/api/login";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "email": email,
      "password": password,
    }),
  );

  return Account.fromJson(jsonDecode(response.body));
}

Future<String> RegisterAccount(
    String fullname, String email, String password) async {
  try {
    final String Url = Host + "/api/login/register";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "fullname": fullname,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<List<Account>> GetUserAll() async {
  final String url = Host + "/api/login/all";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new Account.fromJson(data)).toList();
}

Future<String> ForgotPassword(String email) async {
  final String url = Host + "/api/forgotpassword";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "email": email,
    }),
  );
  var data = json.decode(json.encode(response.body));
  return data;
}

Future<String> ChangeNewPassword(
  String token,
  String password,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "password": password,
        },
      ),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UpdatePassword(
  String token,
  String fullname,
  String password,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "fullname": fullname,
          "password": password,
        },
      ),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UpdateProfile(
  String token,
  String fullname,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "fullname": fullname,
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}
