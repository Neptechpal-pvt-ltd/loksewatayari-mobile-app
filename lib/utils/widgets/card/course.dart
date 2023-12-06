
import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';

class CourseCard extends StatelessWidget {
  final List<String> textforCourseImage = [
    'How to Prepare for Loksewa Examination?',
    'How to do better at Loksewa Interview?',
  ];

  final List<String> textforcoursedes = [
    '8 Lessons - 32 Videos - 18 Files',
    '8 Lessons - 32 Videos - 18 Files',
  ];
  final List<ImageProvider<Object>> courseImage = [
    const AssetImage(AssetsPath.ongoing2),
    const AssetImage(AssetsPath.ongoing3),
  ];
  CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Courses",
                style: TextStyle(
                    color: AppColor.credentialName,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.36,
          // width: 262,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: textforCourseImage.length,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.20,
                width: MediaQuery.sizeOf(context).width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: AppColor.textFieldTextColor)
                ),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        fit: BoxFit.cover,
                        image: courseImage[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        textforCourseImage[index],
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage(AssetsPath.star)),
                          Text(
                            "4.9 400 Enrolled",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            textforcoursedes[index],
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
