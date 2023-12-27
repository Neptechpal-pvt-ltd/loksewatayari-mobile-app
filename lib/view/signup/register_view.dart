// Import the Dio package
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/model/register_modal.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/utils/widgets/buttons/textbtnfield.dart';
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
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Form(
                key: authProvider.formKeys[0],
                child: Column(
                  children: [
                    const CustomAppbar(),
                    Image.asset(
                      AssetsPath.transparentlogo,
                      height: MediaQuery.of(context).size.height * 0.19,
                    ),
                    // Use TextButtonField for each input field
                    TextButtonField(
                      labeltext: "First Name",
                      controller: authProvider.firstnameController,
                      isRequired: true,
                      formKey: authProvider.formKeys[0],
                    ),
                    TextButtonField(
                      labeltext: "Middle Name",
                      controller: authProvider.middlenameController,
                      isRequired: false,
                      formKey: authProvider.formKeys[1],
                    ),
                    TextButtonField(
                      labeltext: "Last Name",
                      controller: authProvider.lastnameController,
                      isRequired: true,
                      formKey: authProvider.formKeys[2],
                    ),
                    TextButtonField(
                      labeltext: "UserName",
                      controller: authProvider.usernameController,
                      isRequired: true,
                      formKey: authProvider.formKeys[3],
                    ),
                    TextButtonField(
                      labeltext: "Email Address",
                      controller: authProvider.emailController,
                      isRequired: true,
                      formKey: authProvider.formKeys[4],
                    ),
                    TextButtonField(
                      labeltext: "Password",
                      controller: authProvider.passwordController,
                      obscureText: true,
                      isRequired: true,
                      formKey: authProvider.formKeys[5],
                      showText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          if (authProvider.formKeys.every((formKey) =>
                              formKey.currentState?.validate() ?? true)) {

                            if (kDebugMode) {
                              print(UsersData(
                                username: authProvider.usernameController.text,
                                firstName:
                                    authProvider.firstnameController.text,
                                lastName: authProvider.lastnameController.text,
                                middleName:
                                    authProvider.middlenameController.text,
                                email: authProvider.emailController.text,
                                password: authProvider.passwordController.text,
                              ));
                            }


                            await authProvider.register(
                              UsersData(
                                username: authProvider.usernameController.text,
                                firstName:
                                    authProvider.firstnameController.text,
                                lastName: authProvider.lastnameController.text,
                                middleName:
                                    authProvider.middlenameController.text,
                                email: authProvider.emailController.text,
                                password: authProvider.passwordController.text,
                              ),
                            );

                            print(authProvider.isAuthenticated);
                                 if (authProvider.isSucess) {
                                Navigator.pushNamed(context, Routes.logIn);
                              }
                            if (authProvider.isAuthenticated) {

                            if (kDebugMode) {
                              print(authProvider.isAuthenticated);
                            }
                            if (authProvider.isAuthenticated &&
                                context.mounted) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('You are registered'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                         
                              // Navigator.pushNamed(context, Routes.logIn);
                            } else {
                              if (kDebugMode) {
                                print("failed");
                              }
                            }
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
                            const TextSpan(
                              text: 'Already have an account?.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                                color: AppColor.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Routes.logIn);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<void> _validateFields(BuildContext context, AuthProvider authProvider) async {
  //   authProvider.formKeys.forEach((formKey) => formKey.currentState?.validate());

  //   if (authProvider.formKeys.every((formKey) => formKey.currentState?.validate() ?? false)) {
  //     UsersData reg = UsersData(
  //       username: authProvider.usernameController.text,
  //       firstName: authProvider.firstnameController.text,
  //       lastName: authProvider.lastnameController.text,
  //       middleName: authProvider.middlenameController.text,
  //       email: authProvider.emailController.text,
  //       password: authProvider.passwordController.text,
  //     );

  //     Map<String, dynamic> userData = reg.toJson();

  //     try {
  //       // Replace with your Dio instance
  //       final dio = Dio();

  //       final response = await dio.post(
  //         'https://your-api-endpoint.com/register',
  //         options: Options(headers: {'Content-Type': 'application/json'}),
  //         data: jsonEncode(userData),
  //       );

  //       if (response.statusCode == 200) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Registration successful!'),
  //             duration: const Duration(seconds: 2),
  //           ),
  //         );
  //         Navigator.pushNamed(context, Routes.logIn);
  //       } else {
  //         print('Registration failed! Status code: ${response.statusCode}');
  //       }
  //     } catch (e) {
  //       print('Error during registration: $e');
  //     }
  //   } else {
  //     print('Form validation failed!');
  //   }
  // }
}
