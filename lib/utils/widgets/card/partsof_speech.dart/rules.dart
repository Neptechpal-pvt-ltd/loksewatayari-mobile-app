import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';

class RulesOfPartsOfSpeech extends StatelessWidget {
  const RulesOfPartsOfSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Image(
                image: AssetImage(
                  AssetsPath.rulesOfpartsofSpeech,
                ),
                fit: BoxFit.cover,
                // height: 250,
                width: 200,
              ),
              const Row(
                children: [
                  Text(
                    "Part Of Speech",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Rules to get you started",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                // height: 135,
                width: 358,
                // color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "1) You get 25 seconds to answer each question; watch the timer at the top ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          "2)  5 points for the correct answer; up to 5 additional points as Speed bonus if you answer quickly ",
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                              textAlign: TextAlign.start,
                              "3) There is no negative marking for wrong answers."),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              NavButton(
                btnText: "Let's Play",
                color: AppColor.primaryColor,
                textColor: AppColor.borderColor,
                onClick: () {
                  Navigator.pushNamed(context, Routes.qsnPOS);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
