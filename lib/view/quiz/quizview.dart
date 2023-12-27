import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/card/choose_topic.dart';
// ignore: unused_import
import 'package:loksewa/utils/widgets/card/notes_card.dart';
import 'package:loksewa/utils/widgets/card/subject.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            width: 390,
            height: 169,
            child: Stack(
              children: <Widget>[
                const Image(image: AssetImage(AssetsPath.engtopbar)),
                const Padding(
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
                          "Engineering",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, left: 150, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: AppColor.borderColor,
                      ),
                      // DropdownButton(items: const [], onChanged: null),
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
                            "Search Quiz Screens...",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.19,
              width: MediaQuery.sizeOf(context).width * 3.58,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Unlock Premium Quiz",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Unlock Quiz premium to prepare loksewa exam.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xffEAEBF0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 98,
                              decoration: BoxDecoration(
                                  color: AppColor.borderColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(child: Text("Unlock Now")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Image(image: AssetImage(AssetsPath.crown))
                ],
              ),
            ),
          ),
          SubjectCard(),
          TopicSelection()
        ],
      ),
    );
  }
}
