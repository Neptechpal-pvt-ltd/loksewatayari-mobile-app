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

class LogInView extends StatefulWidget {
  LogInView({Key? key});

  @override
  _LogInViewState createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _formKey = GlobalKey<FormState>();
  // bool _isPasswordVisible = false; // Track password visibility

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    children: [
                      CustomAppbar(),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage(AssetsPath.transparentlogo),
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        AppString.appName,
                        style: TextStyle(
                          color: AppColor.credentialName,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          AppString.welcome,
                          style: TextStyle(
                            color: AppColor.textFieldTextColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "UserName",
                                style: TextStyle(
                                  color: AppColor.credentialName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: MediaQuery.of(context).size.height * 0.004),
                          child: TextFormField(
                            cursorColor: AppColor.primaryColor,
                            controller: authProvider.usernameController,
                            decoration: InputDecoration(
                              hintText: "Enter Your Username",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 243, 250),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username is required';
                              }
                              return null; // No error if the value is not empty
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  color: AppColor.credentialName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: MediaQuery.of(context).size.height * 0.004),
                          child: TextFormField(
                            cursorColor: AppColor.primaryColor,
                            controller: authProvider.passwordController,
                            // obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColor.primaryTextColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null; // No error if the value is not empty
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.forgetpass);
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.014,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState?.validate() ?? true) {
                                await authProvider.authenticateUser(context);
                                if (authProvider.isAuthenticated) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('You are logged in'),
                                    duration: Duration(seconds: 2),
                                  ));
                                  Navigator.pushNamed(context, Routes.career);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Wrong username or password'),
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              }
                            },
                            child: const NavButton(
                              btnText: "LogIn",
                              color: AppColor.primaryColor,
                              textColor: AppColor.primaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text("or logIn With"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 169, 171, 171),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.2),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.014),
                            child: Image(image: AssetImage(AssetsPath.google)),
                          ),
                          Text(
                            AppString.loginwithG,
                            style: TextStyle(
                              color: AppColor.credentialName,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Already Have an Account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.016,
                            color: AppColor.textFieldTextColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: AppColor.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, Routes.signUp);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
