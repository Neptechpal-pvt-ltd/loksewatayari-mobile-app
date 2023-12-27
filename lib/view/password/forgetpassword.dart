import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/view_model.dart/password/otp_view_model.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpInfoViewModel>(
        builder: (context, emailviewmodel, child) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Forget Password?"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.25,
              ),
              // Text(
              //   "Forget Password?",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              // ),
              Center(
                  child: Image(
                image: const AssetImage(AssetsPath.lock),
                height: MediaQuery.sizeOf(context).height * 0.28,
              )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Enter your email Associated with your account.We will send you a reset link",
                  textAlign: TextAlign.center,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: AppColor.credentialName,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: TextFormField(
                  cursorColor: AppColor.primaryColor,
                  // controller: authProvider.usernameController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 242, 243, 250),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    emailviewmodel.updateEmailController(value);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              NavButton(
                btnText: "Submit",
                textColor: emailviewmodel.emalController.text != ''
                    ? AppColor.borderColor
                    : AppColor.primaryColor,
                color: emailviewmodel.emalController.text != ''
                    ? AppColor.primaryColor
                    : AppColor.borderColor,
                onClick: () {
                  Navigator.pushNamed(context, Routes.otpverify);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
