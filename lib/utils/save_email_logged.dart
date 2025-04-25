import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveEmailLogged(String email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
}

Future<String?> getEmailLogged() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

Future<void> removerEmailLogged() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('email');
}
