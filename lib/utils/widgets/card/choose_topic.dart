import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/card/mock_test_rules.dart';
import 'package:loksewa/utils/widgets/card/partsof_speech.dart/rules.dart';

class TopicSelection extends StatelessWidget {
  final List<String> notesTitle = [
    'Parts Of Speech',
    'Mock Test',
    'Use of Preposition',
    'Basic Grammatical Structure',
    'Direct and Indirect Speech',
    'Transformation Of Sentence',
    'Word Stress',
  ];

  final List<ImageProvider<Object>> imageNotes = [
    const AssetImage(AssetsPath.partsofSpeech),
    const AssetImage(AssetsPath.partsofSpeech),
    const AssetImage(AssetsPath.prepo),
    const AssetImage(AssetsPath.partsofSpeech),
    const AssetImage(AssetsPath.directspeech),
    const AssetImage(AssetsPath.transformation),
    const AssetImage(AssetsPath.stress),
  ];

  TopicSelection({super.key});

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
                  "Choose a Topics",
                  style: TextStyle(
                      color: AppColor.credentialName,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: notesTitle.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  color: Colors.amber,
                                  child: const RulesOfPartsOfSpeech());
                            });
                       case 1:
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  color: Colors.amber,
                                  child: const MockTestRules());
                            });
                    }
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: imageNotes[index],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            notesTitle[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
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
    );
  }
}
