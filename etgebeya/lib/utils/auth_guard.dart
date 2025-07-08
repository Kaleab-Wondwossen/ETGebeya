import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  return token != null;
}
