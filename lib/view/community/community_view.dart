import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const CustomAppbar(
              text: "Community",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.askqsn);
                  },
                  child: Container(
                    height: 48,
                    width: 298,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.borderColor)),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        SvgPicture.asset(AssetsPath.edit),
                        const SizedBox(width: 20),
                        const Text("Ask your Question")
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.borderColor)),
                  child: SvgPicture.asset(
                    AssetsPath.gallery,
                    height: 24,
                    width: 24,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Divider(
                height: 1,
                color: AppColor.borderColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Showing:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff49556D)),
                  ),
                  Text(
                    "Latest",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff151B2B)),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 289,
                width: 358,
                color: AppColor.primaryTextColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(AssetsPath.vishnu),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vishnu Kumar",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff151B2B)),
                              ),
                              Text(
                                "3 hours Ago",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff49556D)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Can anyone send me the history of world from book?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "WAP to accept a number. Check if it is a 4-digit number or not . If it is a 4-digit number then extract all the digits using for loop . display all the digits . pls right answer only .​",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff384255)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Divider(
                        color: AppColor.borderColor,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsPath.like),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Like(0)",
                            style: TextStyle(color: Color(0xff49556D)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AssetsPath.comment),
                        ),
                        Text("Comment(0)",
                            style: TextStyle(color: Color(0xff49556D))),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(AssetsPath.share),
                        ),
                        Text("Share",
                            style: TextStyle(color: Color(0xff49556D))),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 358,
                height: 484,
                color: AppColor.primaryTextColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(AssetsPath.vishnu),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vishnu Kumar",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff151B2B)),
                              ),
                              Text(
                                "3 hours Ago",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff49556D)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Image.asset(
                      AssetsPath.askqsn,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Can anyone send me the history of world from book?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "WAP to accept a number. Check if it is a 4-digit number or not . If it is a 4-digit number then extract all the digits using for loop . display all the digits . pls right answer only .​",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff384255)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Divider(
                        color: AppColor.borderColor,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsPath.like),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Like(0)",
                            style: TextStyle(color: Color(0xff49556D)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AssetsPath.comment),
                        ),
                        Text("Comment(0)",
                            style: TextStyle(color: Color(0xff49556D))),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(AssetsPath.share),
                        ),
                        Text("Share",
                            style: TextStyle(color: Color(0xff49556D))),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
