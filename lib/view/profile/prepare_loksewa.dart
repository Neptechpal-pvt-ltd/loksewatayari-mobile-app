import 'package:flutter/material.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';

class PrepareLoksewa extends StatelessWidget {
  List<String> introduction = [
    'Introduction of Loksewa Exam',
    'Loksewa Exam',
    'Loksewa Exam'
  ];
  PrepareLoksewa({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            CustomAppbar(
              text: "How to Prepare for Loksewa Exam?",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lesson 1 - Introduction",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff384255)),
                  ),
                  Text(
                    "30 Mins",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff324191)),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    int itemIndex = index + 1;
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.pushNamed(context, Routes.loksewavideo);

                          // case 1:
                          //   Navigator.pushNamed(
                          //       context, Routes.trackProgress);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 68,
                          decoration: BoxDecoration(
                            color: AppColor.borderColor,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff101828)
                                    .withOpacity(0.4), // color of the shadow
                                spreadRadius: 0, // spread radius
                                blurRadius: 2, // blur radius
                                offset: const Offset(
                                    1, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 358,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xffEFEFF1),
                                      child: Text(
                                        '$itemIndex',
                                        style: TextStyle(
                                            color: AppColor.primaryColor),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          introduction[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Color(0xff151B2B)),
                                        ),
                                        Text("10 mins")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.video_collection,
                                  color: AppColor.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
