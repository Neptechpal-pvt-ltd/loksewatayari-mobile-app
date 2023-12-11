import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/utils/widgets/buttons/signup_button.dart';
import 'package:loksewa/view_model.dart/login/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                CustomAppbar(),
                Image.asset(
                  AssetsPath.loksewanewlogo,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                ),
                TextButtonField(
                  controller: context.read<AuthProvider>().fullnameController,
                  labeltext: "Full Name",
                ),
                TextButtonField(
                  controller: context.read<AuthProvider>().usernameController,
                  labeltext: "UserName",
                ),
                TextButtonField(
                  controller: context.read<AuthProvider>().emailController,
                  labeltext: "Email Address",
                ),
                TextButtonField(
                  controller: context.read<AuthProvider>().passwordController,
                  labeltext: "password",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      await authProvider.authenticateUser();
                      if (authProvider.isAuthenticated) {
                        Navigator.pushNamed(context, Routes.logIn);
                      }
                    },
                    child: const NavButton(
                      btnText: "Register",
                      color: AppColor.primaryColor,
                      textColor: AppColor.primaryTextColor,
                    ),
                  ),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account?.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                                color: AppColor.primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, Routes.logIn);
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
