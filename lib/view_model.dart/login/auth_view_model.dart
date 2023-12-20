import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/model/register_modal.dart';
import 'package:loksewa/model/responsemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
// final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> authenticateUser() async {
    await Future.delayed(Duration(seconds: 2));

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
      throw e;
    }
  }

  Dio _dio = Dio();

  Future<void> register(UsersData userDetail) async {
    try {
      final Map<String, dynamic> requestData = userDetail.toJson();

      print('request data:$requestData');
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
        print('df:${response.data}');
        print('Registration successful: ${response.data}');
        _isAuthenticated = true;
        notifyListeners();
      } else {
        print('Registration failed. Response: ${response.data}');
        throw DioError(
          requestOptions: RequestOptions(path: ''),
          response: response,
        );
      }
    } catch (e) {
      print('Dio exception occurred during registration: $e');
      if (e is DioError) {
        print('DioError: ${e.response!.statusMessage}');
      }
      throw e;
    }
  }
}
