// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ChangePasswordScreen extends StatelessWidget {
//   final String email;
//   final TextEditingController newPasswordController = TextEditingController();

//   ChangePasswordScreen({required this.email});

//   Future<void> changePassword() async {
//     final Dio dio = Dio();

//     try {
//       // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint for changing password
//       final response = await dio.post('https://loksewa.cb-ashik.me/auth/update-password', data: {
//         'email': email,
//         'new_password': newPasswordController.text,
//       });

//       if (response.statusCode == 200) {
//         // Password change successful, you can navigate to a login screen or handle it accordingly
//         print('Password changed successfully');
//       } else {
//         // Handle the error response from the server
//         print('Failed to change password: ${response.data}');
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
//         title: Text('Change Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: newPasswordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Enter new password',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: changePassword,
//               child: Text('Change Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
