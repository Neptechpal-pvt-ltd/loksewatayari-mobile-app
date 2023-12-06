import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/textstyle.dart';

class OnBoardPage4 extends StatelessWidget {
  const OnBoardPage4({super.key});

  @override
  Widget build(BuildContext context) {
    Image image = const Image(image: AssetImage(AssetsPath.ongoing2));
    String title = "Learn Anytime, Anywhere";
    String description =
        "With LokSewa Tayari, your study materials are accessible 24/7. Study at your own pace, from anywhere that suits you.";

    return Column(
      children: [
        Expanded(child: image),
        Text(
          title,
          style: MyTextStyle.titleTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: MyTextStyle.descriptionTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
