import 'dart:convert';
import 'package:nectar_app/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  final String baseUrl = 'https://foodsflow.netlify.app';

  //I am Making developing for signin post method

  Future<bool> signup(UserModel user) async {
    final url = Uri.parse('https://foodsflow.netlify.app/api/auth/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('Signup Error: ${response.body}');
      return false;
    }
  }

  //I am developing function for signin with get method
  Future<bool> signin(UserModel user) async {
    final url = Uri.parse('https://foodsflow.netlify.app/api/auth/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('Sign in Error: ${response.body}');
      return false;
    }
  }
}
