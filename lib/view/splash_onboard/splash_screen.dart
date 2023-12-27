import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/core/const/app_string.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? true;

                    // ignore: unnecessary_null_comparison
                    if (isLoggedIn != null) {
                      // Your existing logic for navigation here


                      if (context.mounted) {
                        isLoggedIn
                            ? Navigator.pushNamed(context, Routes.career)
                            : Navigator.pushNamed(context, Routes.onboarding);
                      }
                    } else {
                      // Handle the case where the value is null
                      // You might want to handle this differently based on your application logic
                      if (kDebugMode) {
                        print('The value of isLoggedIn is null');
                      }
                    }
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
