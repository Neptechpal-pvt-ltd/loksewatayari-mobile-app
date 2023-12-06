import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/textstyle.dart';

class OnBoardPage1 extends StatelessWidget {
  const OnBoardPage1({super.key});

  @override
  Widget build(BuildContext context) {

    Image image = const Image(image: AssetImage(AssetsPath.ongoing2));

    String title = "Your Learning Journey Starts Here";
    String description =
        "Your journey to a successful Lok Sewa career begins here. Let's get started and ace those exams!";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
          // DotIndicator(itemCount: 4, currentIndex: 0),
          const SizedBox(
            height: 10,
          ),
 
        ],
      ),
    );
  }
}
