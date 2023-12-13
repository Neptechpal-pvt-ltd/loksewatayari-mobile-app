import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/model/responsemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
      Token loggedInUser = await postLogin(username, password);

      SharedPreferences prefs = await SharedPreferences.getInstance();
   
       _isAuthenticated = true;
    notifyListeners();
      prefs.setString('accessToken', loggedInUser.accessToken!);
      prefs.setString('refreshToken', loggedInUser.refreshToken!);

  
      final String? accessToken = prefs.getString('accessToken');
      final String? refreshToken = prefs.getString('refreshToken');

      print(accessToken);
      print(refreshToken);


    } on DioException catch (e) {
      print('Dio exception occurred during authentication: $e');
      if (e.response != null) {
        print('Dio exception response: ${e.response?.data}');
      }
    } catch (e) {
      print('Error occurred during authentication: $e');
    }
  }

  Future<Token> postLogin(String username, String password) async {
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
        print(response.data);
        return Token.fromJson(response.data['tokens']);
      } else {
        throw DioException(
            requestOptions: RequestOptions(path: ''), response: response);
      }
    } on DioException catch (e) {
      // Handle DioException
      throw e;
    }
  }


  Dio _dio = Dio();

  Future<void> register(String username, String fullName,String email,String password) async {
    try {
      final Map<String, dynamic> requestData = {
        'username': username,
        'fullname': fullName,
        'email':email,
        'password': password,
        // Add other registration data as needed
      };

      Response response = await _dio.post(
        'http://loksewa.cb-ashik.me/auth/register',
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // Handle successful registration
      } else {
        throw DioError(
          requestOptions: RequestOptions(path: ''),
          response: response,
        );
      }
    } on DioError catch (e) {
      // Handle DioError
      throw e;
    }
  }
}




