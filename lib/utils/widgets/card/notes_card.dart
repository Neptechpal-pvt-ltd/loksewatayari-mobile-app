import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';

class NotesCard extends StatelessWidget {
  final List<String> notesTitle = [
    'Parts Of Speech',
    'Kinds Of Statements',
    'Subject Verb Agreement',
  ];

  final List<ImageProvider<Object>> imageNotes = [
    const AssetImage(AssetsPath.partsofSpeech),
    const AssetImage(AssetsPath.statement),
    const AssetImage(AssetsPath.verb),
  ];

  NotesCard({super.key});

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
                  "Notes",
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
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notesTitle.length,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(color: AppColor.textFieldTextColor
                    // )
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: imageNotes[index],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notesTitle[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.55,
                            child: const Text(
                              "Distinct Words used in a sentence perform different",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
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
