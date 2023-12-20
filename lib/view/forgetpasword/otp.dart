// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:loksewa/view/forgetpasword/changepas.dart';

// class OTPVerificationScreen extends StatelessWidget {
//   final String email;
//   final TextEditingController otpController = TextEditingController();

//   OTPVerificationScreen({required this.email});

//   Future<void> verifyOTP(BuildContext context) async {
//     final Dio dio = Dio();

//     try {
//       final response = await dio.post('YOUR_API_ENDPOINT/verify-otp', data: {
//         'email': email,
//         'otp': otpController.text,
//       });

//       if (response.statusCode == 200) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ChangePasswordScreen(email: email),
//           ),
//         );
//       } else {
//         print('Failed to verify OTP: ${response.data}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Enter the OTP sent to $email'),
//             TextField(
//               controller: otpController,
//               decoration: InputDecoration(
//                 labelText: 'Enter OTP',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => verifyOTP(context), // Pass context here
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
