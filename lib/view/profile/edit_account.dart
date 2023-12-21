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
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: NavButton(
                  btnText: "Save Changes",
                  color: AppColor.primaryColor,
                  textColor: AppColor.borderColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
