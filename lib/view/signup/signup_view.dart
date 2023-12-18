// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:loksewa/core/const/assets_path.dart';
// import 'package:loksewa/core/routes/routes.dart';
// import 'package:loksewa/core/themes/app_color.dart';
// import 'package:loksewa/model/register_modal.dart';
// import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
// import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
// import 'package:loksewa/utils/widgets/buttons/signup_button.dart';
// import 'package:loksewa/view_model.dart/login/auth_view_model.dart';
// import 'package:provider/provider.dart';

// class SignUpView extends StatelessWidget {
//   const SignUpView({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> firstNameFormKey = GlobalKey<FormState>();
//     final GlobalKey<FormState> middleNameFormKey = GlobalKey<FormState>();
//     final GlobalKey<FormState> lastNameFormKey = GlobalKey<FormState>();
//     final GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();
//     final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
//     final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

//     return Consumer<AuthProvider>(
//       builder: (context, authProvider, child) {
//         return SafeArea(
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: SingleChildScrollView(
//               child: Form(
//                 key: firstNameFormKey,
//                 child: Column(
//                   children: [
//                     CustomAppbar(),
//                     Image.asset(
//                       AssetsPath.loksewanewlogo,
//                       height: MediaQuery.of(context).size.height * 0.15,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextButtonField(
//                             formKey: firstNameFormKey,
//                             controller: authProvider.firstnameController,
//                             labeltext: "First Name",
//                             isRequired: true,
//                             obscureText: false,
//                             validator: (value) {
//                               return _isNonEmpty(value!, firstNameFormKey);
//                             },
//                           ),
//                         ),
//                         Expanded(
//                           child: TextButtonField(
//                             formKey: middleNameFormKey,
//                             controller: authProvider.middlenameController,
//                             labeltext: "Middle Name",
//                             obscureText: false,
//                             isRequired: false,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextButtonField(
//                             formKey: lastNameFormKey,
//                             controller: authProvider.lastnameController,
//                             labeltext: "Last Name",
//                             isRequired: true,
//                             obscureText: false,
//                             validator: (value) {
//                               return _isNonEmpty(value!, lastNameFormKey);
//                             },
//                           ),
//                         ),
//                         Expanded(
//                           child: TextButtonField(
//                             formKey: usernameFormKey,
//                             controller: authProvider.usernameController,
//                             labeltext: "UserName",
//                             isRequired: true,
//                             obscureText: false,
//                             validator: (value) {
//                               return _isNonEmpty(value!, usernameFormKey);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     TextButtonField(
//                       formKey: emailFormKey,
//                       controller: authProvider.emailController,
//                       labeltext: "Email Address",
//                       isRequired: true,
//                       obscureText: false,
//                       validator: (value) {
//                         return _isValidEmail(value!, emailFormKey);
//                       },
//                     ),
//                     TextButtonField(
//                       formKey: passwordFormKey,
//                       controller: authProvider.passwordController,
//                       labeltext: "Password",
//                       isRequired: true,
//                       obscureText: true,
//                       validator: (value) {
//                         return _isValidPassword(value!, passwordFormKey);
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GestureDetector(
//                         onTap: () async {
//                           _validateFields(
//                             context, // Pass context here
//                             authProvider,
//                             firstNameFormKey,
//                             middleNameFormKey,
//                             lastNameFormKey,
//                             usernameFormKey,
//                             emailFormKey,
//                             passwordFormKey,
//                           );
//                         },
//                         child: const NavButton(
//                           btnText: "Register",
//                           color: AppColor.primaryColor,
//                           textColor: AppColor.primaryTextColor,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: 'Already have an account?.',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'Login',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontStyle: FontStyle.italic,
//                                 color: AppColor.primaryColor,
//                               ),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.pushNamed(context, Routes.logIn);
//                                 },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _validateFields(
//     BuildContext context, // Add context parameter
//     AuthProvider authProvider,
//     GlobalKey<FormState> firstNameFormKey,
//     GlobalKey<FormState> middleNameFormKey,
//     GlobalKey<FormState> lastNameFormKey,
//     GlobalKey<FormState> usernameFormKey,
//     GlobalKey<FormState> emailFormKey,
//     GlobalKey<FormState> passwordFormKey,
//   ) {
//     _isNonEmpty(authProvider.firstnameController.text, firstNameFormKey);
//     _isNonEmpty(authProvider.lastnameController.text, lastNameFormKey);
//     _isNonEmpty(authProvider.usernameController.text, usernameFormKey);
//     _isValidEmail(authProvider.emailController.text, emailFormKey);
//     _isValidPassword(authProvider.passwordController.text, passwordFormKey);

//     if (firstNameFormKey.currentState!.validate() &&
//         middleNameFormKey.currentState!.validate() &&
//         lastNameFormKey.currentState!.validate() &&
//         usernameFormKey.currentState!.validate() &&
//         emailFormKey.currentState!.validate() &&
//         passwordFormKey.currentState!.validate()) {
//       UsersData reg = UsersData(
//         username: authProvider.usernameController.text,
//         firstName: authProvider.firstnameController.text,
//         lastName: authProvider.lastnameController.text,
//         middleName: authProvider.usernameController.text,
//         email: authProvider.emailController.text,
//         password: authProvider.passwordController.text,
//       );

//       if (authProvider.isAuthenticated) {
//         Navigator.pushNamed(context, Routes.logIn);
//       }
//     }
//   }

//   String _isNonEmpty(String value, GlobalKey<FormState> formKey) {
//     if (value.isEmpty) {
//       formKey.currentState?.validate();
//       return 'This field is required';
//     }
//     return '';
//   }

//   String _isValidEmail(String value, GlobalKey<FormState> formKey) {
//     if (value.isEmpty) {
//       formKey.currentState?.validate();
//       return 'Email is required';
//     } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
//         .hasMatch(value)) {
//       formKey.currentState?.validate();
//       return 'Enter a valid email address';
//     }
//     return '';
//   }

//   String _isValidPassword(String value, GlobalKey<FormState> formKey) {
//     if (value.isEmpty) {
//       formKey.currentState?.validate();
//       return 'Password is required';
//     } else if (value.length < 8) {
//       formKey.currentState?.validate();
//       return 'Password must be at least 8 characters long';
//     } else if (!RegExp(
//             r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|:"<>?~`])[\w!@#$%^&*()_+{}|:"<>?~`]{8,}$')
//         .hasMatch(value)) {
//       formKey.currentState?.validate();
//       return 'Password must contain at least 1 capital letter, 1 number, and 1 special character';
//     }
//     return '';
//   }
// }
