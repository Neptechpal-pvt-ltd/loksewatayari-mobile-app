import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(); // Add email controller
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> authenticateUser() async {
    await Future.delayed(Duration(seconds: 2));

    _isAuthenticated = true;

    notifyListeners();

    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      print('Username and password are required');
      return;
    }

    try {
      Dio dio = Dio();

      final Map<String, dynamic> requestData = {
        'username': username,
        'password': password,
      };

      Response response = await dio.post(
        'http://loksewa.cb-ashik.me/auth/login',
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Authentication successful
        // print('Authentication successful');
        // print('Response: ${response.data}');
        var responseData = response.data;
Map<String, dynamic> dataMap = json.decode(response.data);
if (dataMap.containsKey('tokens')) {
  var tokens = dataMap['tokens'];
  // Use tokens as needed
} else {
  // Handle case where 'tokens' key is not present in the response
}
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('tokens', response.data['tokens']);
        prefs.setString('refreshToken', response.data['refreshToken']);

        // print("access token is : ${prefs.getString('tokens')}");
        // print("Response data:${response.data}");
      } else {
        // Authentication failed
        print('Authentication failed. Status code: ${response.statusCode}');
        print('Response: ${response.data}');
        // Perform error handling or show an error message
      }
    } on DioError catch (e) {
      // DioError handles network-related errors
      print('Dio error occurred during authentication: $e');
      if (e.response != null) {
        // Handle DioError with response (e.g., status code 401)
        print('Dio error response: ${e.response?.data}');
        // Perform error handling or show an error message
      }
    } catch (e) {
      // Handle other errors
      print('Error occurred during authentication: $e');
      // Perform error handling or show an error message
    }
  }

  Future<void> registerUser() async {
    final String username = usernameController.text;
    final String fullname = fullnameController.text;

    final String password = passwordController.text;
    final String email = emailController.text;

    if (username.isEmpty ||
        password.isEmpty ||
        email.isEmpty ||
        fullname.isEmpty) {
      // Perform some validation, e.g., show an error message
      print('Username, password, fullname and email are required');
      return;
    }

    try {
      Dio dio = Dio();

      final Map<String, dynamic> requestData = {
        'fullName': fullname,
        'username': username,
        'password': password,
        'email': email,
      };

      Response response = await dio.post(
        'http://loksewa.cb-ashik.me/auth/register', // Update the endpoint
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Registration successful
        print('Registration successful');
        print('Response: ${response.data}');
        // You may want to navigate to the next screen or perform other actions
      } else {
        // Registration failed
        print('Registration failed. Status code: ${response.statusCode}');
        print('Response: ${response.data}');
        // Perform error handling or show an error message
      }
    } on DioError catch (e) {
      // DioError handles network-related errors
      print('Dio error occurred during registration: $e');
      if (e.response != null) {
        // Handle DioError with response (e.g., status code 401)
        print('Dio error response: ${e.response?.data}');
        // Perform error handling or show an error message
      }
    } catch (e) {
      // Handle other errors
      print('Error occurred during registration: $e');
      // Perform error handling or show an error message
    }
  }
}
