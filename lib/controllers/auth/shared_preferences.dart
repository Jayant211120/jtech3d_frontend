//import some libraries and files
import "package:shared_preferences/shared_preferences.dart";

//create class
class SharedPreference{
//set the token
Future<void> setToken(String token) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString('token', token);
}

//set the role
  Future<void> setRole(String role) async{
    final pref = await SharedPreferences.getInstance();
    pref.setString("role",role);
  }

//get the token
Future<String?> getToken() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString("token");
}

//get the role
Future<String?> getRole() async{
final pref = await SharedPreferences.getInstance();
return pref.getString("role");
}

//remove the token
Future<void> removeToken() async {
  final pref = await SharedPreferences.getInstance();
  pref.remove('token');
}
}