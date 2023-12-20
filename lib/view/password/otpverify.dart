import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/view_model.dart/password/otp_view_model.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class OtpVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OtpInfoViewModel>(builder: (context, otpviewmodel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Enter OTP'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  AssetsPath.transparentlogo,
                ),
                height: 190,
              ),
              Text(
                'Enter the OTP sent to your mobile number',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PinInputTextField(
                    decoration: BoxLooseDecoration(
                      textStyle: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      strokeColorBuilder: PinListenColorBuilder(
                        AppColor.primaryColor, // color of the unfocused text
                        Colors.black, // color of the focused text
                      ),
                    ),
                    pinLength: 5,
                    onChanged: (value) {
                      otpviewmodel.updateOtpController(value);
                    },
                    onSubmit: (String pin) {
                      // Handle pin submission
                      // For example, you can print the entered OTP:
                      print('Entered OTP: $pin');
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Didn't get the OTP??",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              wordSpacing: -0.2,
                              letterSpacing: -0.15)),
                      TextSpan(text: " "),
                      TextSpan(
                          text: "Resend it.",
                          // text: AppString.tapContinueUnderline,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              wordSpacing: -0.2,
                              letterSpacing: -0.15)),
                    ])),
              ),
              SizedBox(
                height: 20,
              ),
              NavButton(
                textColor: otpviewmodel.otpController.text != ''
                    ? AppColor.borderColor
                    : AppColor.primaryColor,
                btnText: "verify",
                color: otpviewmodel.otpController.text != ''
                    ? AppColor.primaryColor
                    : AppColor.borderColor,
                onClick: () {
                  Navigator.pushNamed(context, Routes.createpass);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
