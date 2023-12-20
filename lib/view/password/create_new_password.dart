import 'package:flutter/material.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/utils/widgets/buttons/textbtnfield.dart';

class CreatePassword extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

  CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create New Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                // color: AppColor.primaryColor,
                fontSize: 30,
                fontFamily: 'Gabarito',
                fontWeight: FontWeight.w700,
                height: 0.04,
                letterSpacing: -0.15,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Please enter and confirm your new password. You will need to login after you reset.",
              style: TextStyle(fontSize: 14, color: AppColor.primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextButtonField(
              controller: passwordController,
              labeltext: "New Password",
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextButtonField(
              controller: confirmpassController,
              labeltext: "Confirm Password",
              obscureText: true,
            ),
            SizedBox(height: 30),
            NavButton(
              btnText: "Set New Password",
              color: AppColor.primaryColor,
              textColor: AppColor.primaryTextColor,
            )
          ],
        ),
      ),
    );
  }
}
