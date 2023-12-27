// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class EmailVe
//rificationScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();

//   Future<void> sendVerificationEmail() async {
//     final Dio dio = Dio();

//     try {
//       // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint for email verification
//       final response = await dio.post('https://loksewa.cb-ashik.me/auth/validate-otp',
//        data: {
//         'email': emailController.text,
//       });

//       if (response.statusCode == 200) {
//         // Email sent successfully, handle the response accordingly
//         print('Email sent successfully');
//       } else {
//         // Handle the error response from the server
//         print('Failed to send email: ${response.data}');
//       }
//     } catch (e) {
//       // Handle Dio errors (e.g., network issues)
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Email Verification'),
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
//               onPressed: sendVerificationEmail,
//               child: Text('Send Verification Email'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
