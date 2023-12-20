import 'package:flutter/material.dart';
class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counterText: '', // hide character counter
          border: InputBorder.none,
        ),
      ),
    );;
  }
}