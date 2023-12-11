import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/core/const/app_string.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/view_model.dart/login/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Row(
                children: [
                  const CustomAppbar(),
                ],
              ),
              const Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Image(image: AssetImage(AssetsPath.logo)),
                      Text(
                        AppString.appName,
                        style: TextStyle(
                            color: AppColor.credentialName,
                            fontWeight: FontWeight.w500,
                            fontSize: 28),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          AppString.welcome,
                          style: TextStyle(
                              color: AppColor.textFieldTextColor, fontSize: 18),
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: AppColor.credentialName,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: AppColor.primaryColor,
                          controller:
                              context.read<AuthProvider>().usernameController,
                          decoration: InputDecoration(
                              hintText: "Enter Your Email Address",
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 242, 243, 250)),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: AppColor.credentialName,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: AppColor.primaryColor,
                          controller:
                              context.read<AuthProvider>().passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.primaryTextColor),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            await authProvider.authenticateUser();
                            if (authProvider.isAuthenticated) {
                              // SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                                  
                              // prefs.setString('accessToken', 'your_access_token');
                              // prefs.setString('refreshToken', 'your_refresh_token');

                              Navigator.pushNamed(context, Routes.career);
                            }
                          },
                          child: const NavButton(
                            btnText: "LogIn",
                            color: AppColor.primaryColor,
                            textColor: AppColor.primaryTextColor,
                          ),
                        ),
                      )
                    ],
                  )),
              const Text("or logIn With"),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 48,
                width: 358,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 169, 171, 171)),
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 85),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Image(image: AssetImage(AssetsPath.google)),
                      ),
                      Text(
                        AppString.loginwithG,
                        style: TextStyle(
                            color: AppColor.credentialName,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Already Have an Account? ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColor.textFieldTextColor,
                  ),
                ),
                TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColor.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, Routes.signUp);
                      }),
              ]))
            ],
          ),
        ),
      );
    });
  }
}
