import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/model/register_modal.dart';
import 'package:loksewa/model/responsemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
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

    await Future.delayed(const Duration(seconds: 2));

    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {

      if (kDebugMode) {
        print('Username and password are required');
      }
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


    } on DioException catch (e) {
      if (e.response != null) {
        final int statusCode = e.response!.statusCode!;
        if (statusCode == 401 || statusCode == 403 || statusCode == 404) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong username or password'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('An error occurred: ${e.message}'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(accessToken);
      }
      if (kDebugMode) {
        print(refreshToken);
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Dio exception occurred during authentication: $e');
      }
      if (e.response != null) {
        if (kDebugMode) {
          print('Dio exception response: ${e.response?.data}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during authentication: $e');
      }

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

        if (kDebugMode) {
          print(response.data);
        }

        return Token.fromJson(response.data['tokens']);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''), response: response);
      }

    } on DioError catch (e) {
      throw e;
    }
  }

  // Future<Token> postLogin(String username, String password) async {
  //   try {
  //     Dio dio = Dio();
  //     final Map<String, dynamic> requestData = {
  //       'username': username,
  //       'password': password,
  //     };

  //     Response response = await dio.post(
  //       'http://loksewa.cb-ashik.me/auth/login',
  //       data: requestData,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print(response.data);
  //       return Token.fromJson(response.data['tokens']);
  //     } else {
  //       throw DioException(
  //           requestOptions: RequestOptions(path: ''), response: response);
  //     }
  //   } on DioError catch (e) {
  //     throw e;
  //   }
  // }

  Dio _dio = Dio();

    } on DioException {
      rethrow;
    }
  }

  final Dio _dio = Dio();


  Future<void> register(UsersData userDetail) async {
    try {
      final Map<String, dynamic> requestData = userDetail.toJson();



      if (kDebugMode) {
        print('request data:$requestData');
      }

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

        _isSucess = true;
        _isAuthenticated = true;
        notifyListeners();
      } else {
        _isSucess = false;
        throw DioError(

        if (kDebugMode) {
          print('df:${response.data}');
        }
        if (kDebugMode) {
          print('Registration successful: ${response.data}');
        }
        _isAuthenticated = true;
        notifyListeners();
      } else {
        if (kDebugMode) {
          print('Registration failed. Response: ${response.data}');
        }
        throw DioException(

          requestOptions: RequestOptions(path: ''),
          response: response,
        );
      }
    } catch (e) {

      _isSucess = false;
      if (e is DioError) {

      if (kDebugMode) {
        print('Dio exception occurred during registration: $e');
      }
      if (e is DioException) {
        if (kDebugMode) {
          print('DioException: ${e.response!.statusMessage}');
        }

      }
      rethrow;
    }
  }
}
