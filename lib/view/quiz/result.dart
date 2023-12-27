import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppbar(
              text: "Result",
            ),
            Image.asset(
              AssetsPath.congratulation,
              height: 187,
            ),
            const Text(
              "Congratulations!",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Your Score: 80/100",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  height: 150,
                  width: 358,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.grey.withOpacity(0.2), // color of the shadow
                        spreadRadius: 5, // spread radius
                        blurRadius: 12, // blur radius
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Correct Answers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff49556D)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, top: 2),
                              child: Text(
                                "10 questions",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff151B28)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, top: 20),
                              child: Text(
                                "Skipped",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff49556D)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, top: 4),
                              child: Text(
                                "2",
                                // ignore: unnecessary_const
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Color(0xff151B28)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Completion",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff49556D)),
                              ),
                            ),
                            Text(
                              "14 questions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xff151B28)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                              child: Text(
                                "Incorrect answers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff49556D)),
                              ),
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xff151B28)),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: NavButton(
                onClick: () {
                  Navigator.pushNamed(context, Routes.qsnPOS);
                },
                btnText: "Play Again",
                color: AppColor.primaryColor,
                textColor: AppColor.borderColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: NavButton(
                isOther: true,
                onClick: () {
                  Navigator.pushNamed(context, Routes.home);
                },
                btnText: "Back to Home",
                // color: AppColor.primaryColor,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
