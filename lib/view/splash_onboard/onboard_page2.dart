import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/textstyle.dart';

class OnBoardPage2 extends StatelessWidget {
  const OnBoardPage2({super.key});

  @override
  Widget build(BuildContext context) {
    Image image = const Image(image: AssetImage(AssetsPath.ongoing3));

    String title = "Explore Courses";
    String description =
        "Browse a wide range of courses tailored for your Lok Sewa exam preparation. Choose the perfect path to your dream government job.";

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
