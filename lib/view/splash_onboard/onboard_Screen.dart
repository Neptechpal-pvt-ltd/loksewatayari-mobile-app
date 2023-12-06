// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/buttons/dot_indicator.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';

import 'package:loksewa/view/splash_onboard/onboard_page1.dart';
import 'package:loksewa/view/splash_onboard/onboard_page2.dart';
import 'package:loksewa/view/splash_onboard/onboard_page3.dart';
import 'package:loksewa/view/splash_onboard/onboard_page4.dart';
import 'package:loksewa/view_model.dart/onboarding_view_model.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> onboardingPages = [
      const OnBoardPage1(),
      const OnBoardPage2(),
      const OnBoardPage3(),
      const OnBoardPage4(),
    ];

    return SafeArea(
      child: Scaffold(
        body: Consumer<OnboardViewModel>(
          builder: (_, onboardViewModel, __) {
            String buttonText = onboardViewModel.currentPage < 3
                ? "Next"
                : onboardViewModel.currentPage == 3
                    ? "Let's Begin"
                    : "";

            // Determine whether to automatically transition to the next page

            return Column(
              children: [
                // const Image(image: AssetImage(AssetsPath.onBoardImage)),
                // const SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: PageView.builder(
                    controller: onboardViewModel.pageController,
                    itemCount: onboardingPages.length,
                    itemBuilder: (context, index) {
                      return onboardingPages[index];
                    },
                    onPageChanged: (page) {
                      onboardViewModel.changePage(page);
                    },
                  ),
                ),
                DotIndicator(
                  itemCount: onboardingPages.length,
                  currentIndex: onboardViewModel.currentPage,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NavButton(
                    btnText: buttonText,
                    color: AppColor.primaryColor,
                    textColor: AppColor.primaryTextColor,
                    onClick: () {
                      if (onboardViewModel.currentPage == 3) {
                        Navigator.pushNamed(context, Routes.logIn);

                        // onboardViewModel
                        //     .changePage(onboardViewModel.currentPage + 1);
                      } else {
                        onboardViewModel.changePage(onboardViewModel.currentPage+1);
                        // onboardViewModel
                        //     .changePage(onboardViewModel.currentPage + 1);
                        // Navigator.pushNamed(context, Routes.logIn);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
