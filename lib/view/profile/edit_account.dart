import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/utils/widgets/formtextfield/formtextfield.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const CustomAppbar(
              text: "Edit Account",
            ),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AssetsPath.profile),
            ),
            FormTextField(
              title: "Full Name",
              hinttxt: "Enter your Full Name",
            ),
            FormTextField(
              title: "Email Address",
              hinttxt: "Enter your email Address",
            ),
            FormTextField(
              title: "Phone Number",
              hinttxt: "Enter your Phone Number",
            ),
            FormTextField(
              title: "Address",
              hinttxt: "Enter your Address",
            ),
            FormTextField(
              title: "Career",
              hinttxt: "Select Career",
            ),
            FormTextField(
              title: "Courses",
              hinttxt: "Select Course",
            ),
            Expanded(
              flex: 2,
              child: ListView(
                physics: NeverScrollableScrollPhysics(), // Set physics property
                shrinkWrap: true,
                children: [
                  NavButton(
                    btnText: "Save Changes",
                    color: AppColor.primaryColor,
                    textColor: AppColor.borderColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class RegistrationWidget extends StatelessWidget {
//   final String apiUrl = 'https://api.example.com/register';

//   Future<void> registerUser(String username, String email, String password) async {
//     try {
//       Dio dio = Dio();

//       // Create a map with user registration data
//       Map<String, dynamic> userData = {
//         'username': username,
//         'email': email,
//         'password': password,
//         // Add other necessary fields
//       };

//       // Make a POST request to register the user
//       Response response = await dio.post(
//         apiUrl,
//         data: userData,
//       );

//       // Check if the registration was successful (status code 200)
//       if (response.statusCode == 200) {
//         // Registration successful
//         print('Registration successful');
//         // You can handle the response or navigate to another screen
//       } else {
//         // Handle registration failure
//         print('Registration failed: ${response.statusCode}');
//       }
//     } catch (error) {
//       // Handle DioError or other exceptions
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Registration'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Trigger the registration when the button is pressed
//             registerUser('example_username', 'example@email.com', 'example_password');
//           },
//           child: Text('Register User'),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: RegistrationWidget(),
//     ),
//   );
// }
