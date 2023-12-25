import 'package:flutter/material.dart';

class OtpInfoViewModel extends ChangeNotifier {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get otpController => _otpController;
  updateOtpController(String value) {
    _otpController.text = value;
    notifyListeners();
  }

  TextEditingController get emalController => _emailController;
  updateEmailController(String value) {
    _emailController.text = value;
    notifyListeners();
  }
}
