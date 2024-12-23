import 'package:shared_preferences/shared_preferences.dart';

getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  return email;
}

getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('token');
}
