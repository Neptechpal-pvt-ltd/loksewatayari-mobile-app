import 'package:flutter/material.dart';
import 'package:loksewa/core/const/app_string.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Expanded(flex: 3, child: Text("")),
              const Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Image(image: AssetImage(AssetsPath.logo)),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        AppString.appName,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: AppColor.primaryColor),
                      )
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.onboarding);
                  },
                  child: const CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
