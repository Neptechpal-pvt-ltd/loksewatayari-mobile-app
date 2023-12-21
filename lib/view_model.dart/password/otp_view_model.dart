import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/core/routes/routes.dart';

class OtpInfoViewModel extends ChangeNotifier {
  TextEditingController _otpController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController get otpController => _otpController;
  updateOtpController(String value) {
    _otpController.text = value;
    notifyListeners();
  }

  TextEditingController get emailController => _emailController;
  updateEmailController(String value) {
    _emailController.text = value;
    notifyListeners();
  }

  Future<void> requestOTP(BuildContext context) async {
    final Dio dio = Dio();
    try {
      final response = await dio.post(
          'https://loksewa.cb-ashik.me/auth/forget-password',
          data: {'email': emailController.text});
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, Routes.otpverify);
      } else {
      }
    } catch (e) {
    }
  }

}
