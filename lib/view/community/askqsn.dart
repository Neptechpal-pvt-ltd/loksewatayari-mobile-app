import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';

class AskQsn extends StatelessWidget {
  const AskQsn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppbar(
              text: "Ask your Question",
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 104,
                width: 358,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: AppColor.borderColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "What's your Question?",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                actions: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(AssetsPath.camera),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Take Photo From Camera"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                AssetsPath.photogalery),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Select Photo From Gallery"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                  // TextButton(
                                  //   onPressed: () {
                                  //     Navigator.of(context)
                                  //         .pop(); // Close the dialog
                                  //   },
                                  //   child: Text('Close'),
                                  // ),
                                ],
                              );
                            },
                          );
                          // AlertDialog(
                          //   title: Text("Take a Photo from Camera"),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetsPath.gallery),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Add Image")
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(AssetsPath.tags),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Add Tags")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(AssetsPath.link),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Add Link")
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            NavButton(
              btnText: "Post Question",
              color: AppColor.primaryColor,
              textColor: AppColor.borderColor,
            )
          ],
        ),
      ),
    );
  }
}
