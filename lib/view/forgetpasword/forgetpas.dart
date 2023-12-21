// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:loksewa/view/forgetpasword/otp.dart';


// class ForgotPasswordScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();

//   Future<void> requestOTP(BuildContext context) async {
//     final Dio dio = Dio();

//     try {
//       final response = await dio.post('https://loksewa.cb-ashik.me/auth/forget-password', data: {
//         'email': emailController.text,
//       });

//       if (response.statusCode == 200) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => OTPVerificationScreen(email: emailController.text),
//           ),
//         );
//       } else {
//         print('Failed to request OTP: ${response.data}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Enter your email',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => requestOTP(context), // Pass context here
//               child: Text('Request OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
