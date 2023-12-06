import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';

class UncompletedCourseCard extends StatelessWidget {
  const UncompletedCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Uncompleted Courses,Quiz",
                  style: TextStyle(
                      color: AppColor.credentialName,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.20,
              width: MediaQuery.sizeOf(context).width * 3.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryTextColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Image(image: AssetImage(AssetsPath.partsofSpeech)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "IQ Test",
                            style: TextStyle(
                              color: AppColor.credentialName,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              width: 250,
                              child: const Text(
                                "Distinct Words Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse molestie.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff5F6D7E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "80 Points",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        Text(
                          "100 Points",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: AppColor.primaryColor,
                      minHeight: 10,
                      value: 0.8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
