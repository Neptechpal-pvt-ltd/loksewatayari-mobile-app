import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> authenticateUser() async {
      await Future.delayed(Duration(seconds: 2));

    _isAuthenticated = true;

    notifyListeners();

    
    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Perform some validation, e.g., show an error message
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
        print('Authentication successful');
        print('Response: ${response.data}');
        // You may want to navigate to the next screen or perform other actions
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
}
