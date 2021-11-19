import 'package:fiktur/models/auth_response.dart';
import 'package:fiktur/models/profile.dart';
import 'package:fiktur/models/register.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalDbService{
  

  static void saveUserInfo(AuthResponse authResponse) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("firstName", authResponse.firstName);
    prefs.setString("lastName", authResponse.lastName);
    prefs.setInt("userId", authResponse.userId);
    prefs.setString("token", authResponse.token);
    prefs.setInt("expiration", authResponse.expiration.millisecond);
  }

  void logOut() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.clear();
  }
  Future<String?> getToken() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
  Future<String?> getExpiration() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString("expiration");
  }
  // Future<String?> firstName() async{
  //   SharedPreferences prefs= await SharedPreferences.getInstance();
  //   return prefs.getString("firstName");
  // }

  static Future<Profile> getProfile() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return Profile(prefs.getString("firstName"), prefs.getString("lastName"), "email");
  }

}