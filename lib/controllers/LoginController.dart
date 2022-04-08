import 'package:hospitel/services/loginService.dart';

Future<dynamic> LoginController() async {
  var result = await Login();
  print(result);
}
