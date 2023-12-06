import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';

class TrackMyProgress extends StatefulWidget {
  const TrackMyProgress({Key? key}) : super(key: key);

  @override
  _TrackMyProgressState createState() => _TrackMyProgressState();
}

class _TrackMyProgressState extends State<TrackMyProgress> {
  bool showOngoingCourses = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppbar(
              text: "My Courses",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showOngoingCourses = true;
                      });
                    },
                    child: Text(
                      "Ongoing Courses",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showOngoingCourses = true;
                      });
                    },
                    child: Text(
                      "Completed Courses",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            if (showOngoingCourses)
              Expanded(
                child: ListView.builder(
                  itemCount: 4, // Adjust the item count as needed
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff101828)
                                  .withOpacity(0.1), // Shadow color
                              spreadRadius: 0, // How much to spread the shadow
                              blurRadius: 8, // How much to blur the shadow
                              offset: Offset(
                                  0, 4), // Changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AssetsPath.courseeg,
                                  // height: 68,
                                  // width: 68,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.prepareloksewa);
                                  },
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.13,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "How to Prepare for Loksewa Examination?",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color(0xff151B2B)),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                              "Distinct Words Lorem ipsum dolor sit a...")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "12 Lessons",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Color(0xff324191)),
                                  ),
                                  Text(
                                    "16 lessons",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff5F6D7E)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 15),
                              child: LinearProgressIndicator(
                                backgroundColor: const Color(0xffEAEBF0),
                                color: AppColor.primaryColor,
                                minHeight: 8,
                                value: 0.6,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
