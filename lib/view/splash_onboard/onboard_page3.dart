import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/textstyle.dart';

class OnBoardPage3 extends StatelessWidget {
  const OnBoardPage3({super.key});

  @override
  Widget build(BuildContext context) {
    Image image = const Image(image: AssetImage(AssetsPath.onBoardImage));

    String title = "Track Your Progress";
    String description =
        "Stay motivated with progress tracking. Monitor your quiz scores, review your performance, and watch your skills grow.";

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
        // DotIndicator(itemCount: 4, currentIndex: 2),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
