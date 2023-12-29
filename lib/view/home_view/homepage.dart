import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/card/course.dart';
import 'package:loksewa/utils/widgets/card/downloaded_resources.dart';
import 'package:loksewa/utils/widgets/card/latest_news.dart';
import 'package:loksewa/utils/widgets/card/notes_card.dart';
import 'package:loksewa/utils/widgets/card/subject.dart';
import 'package:loksewa/utils/widgets/card/uncompleted_course.dart';
import 'package:loksewa/view_model.dart/selectcareer_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedCareer = Provider.of<SelectboxViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              width: 390,
              height: 169,
              child: Stack(
                children: <Widget>[
                  const Image(image: AssetImage(AssetsPath.engtopbar)),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Course",
                          style: TextStyle(
                              color: AppColor.primaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            selectedCareer.careertitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.career);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, left: 150, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: AppColor.borderColor,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(AssetsPath.profile),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 120,
                      // bottom: 5,
                      left: 20,
                      child: Container(
                        height: 48,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18)),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.search,
                              ),
                            ),
                            Text(
                              "Search Syllabus, Notes, News...",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SubjectCard(),
            const UncompletedCourseCard(),
            CourseCard(),
            NotesCard(),
            const LatestNews(),
            DownloadResources(),
          ],
        ),
      ),
    );
  }
}
