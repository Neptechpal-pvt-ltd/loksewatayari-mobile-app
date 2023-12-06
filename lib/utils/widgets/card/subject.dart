import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';

class SubjectCard extends StatelessWidget {
  final List<String> texts = [
    'English',
    'Physics',
    'Chemistry',
  ];

  final List<ImageProvider<Object>> images = [
    const AssetImage(AssetsPath.english),
    const AssetImage(AssetsPath.physics),
    const AssetImage(AssetsPath.chemistry),
  ];
  SubjectCard({super.key});

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
                  "Subjects",
                  style: TextStyle(
                      color: AppColor.credentialName,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 75, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: texts.length,
              itemBuilder: (context, index) {
                return Container(
                  // height: 38,
                  width: 124,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColor.textFieldTextColor,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: images[index],
                          // width: 80,
                          // height: 80,
                        ),
                      ),
                      Text(
                        texts[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
