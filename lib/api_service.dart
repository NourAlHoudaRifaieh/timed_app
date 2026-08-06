import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  final String baseUrl = "https://timedapp.com";

  Future<bool> saveLogin(String username, String password) async{
    final Map<String,dynamic> loginData = {
      username: username,
      password: password,
    };
    final url = Uri.parse("$baseUrl/savelogin");
    try{
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json'
          },
          body: {'username': username, 'password': password},
      );
      return response.statusCode == 200 || response.statusCode == 201;
    }catch(e){
      return true;
    }
  }

}