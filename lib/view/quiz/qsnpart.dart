import 'package:flutter/material.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/utils/widgets/buttons/optionbutton.dart';
import 'package:provider/provider.dart';

import '../../view_model.dart/selectcareer_view_model.dart';

class QsnOfPartsOFSpeech extends StatelessWidget {
  int selectedButtonIndex = -1;
  void selectButton(int index) {
    selectedButtonIndex = index;
  }

  final List<String> options = ['None', 'Flight', 'Frightened', 'Frying'];
  QsnOfPartsOFSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    final selectboxViewModel = Provider.of<SelectboxViewModel>(context);

    bool isContinueButtonPurple = selectboxViewModel.selectedButtonIndex != -1;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const CustomAppbar(
                text: "Parts Of Speech",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Question No. 14 of 20",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor),
                    ),
                    Text(
                      "Score: 10",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  backgroundColor: const Color(0xffEAEBF0),
                  color: AppColor.primaryColor,
                  minHeight: 8,
                  value: 0.6,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 358,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.grey.withOpacity(0.2), // color of the shadow
                        spreadRadius: 5, // spread radius
                        blurRadius: 12, // blur radius
                        offset: const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Find the Suitable verb for the given noun “fright”",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final isSelected =
                          index == selectboxViewModel.selectedButtonIndex;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: OptionButton(
                            // isOther: t
                            btnText: options[index],
                            onClick: () {
                              selectboxViewModel.selectButton(index);
                            },
                            color: isSelected
                                ? AppColor.primaryColor
                                : const Color(0xffEAEBF0),
                            textColor: isSelected
                                ? AppColor.borderColor
                                : Colors.black),
                      );
                    }),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Next Question in",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
              const Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth:
                        4, // Adjust the thickness of the progress indicator
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  Text(
                    '12', // Displaying percentage
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NavButton(
                  btnText: "Submit",
                  color: isContinueButtonPurple
                      ? AppColor.primaryColor
                      : AppColor.borderColor,
                  textColor: isContinueButtonPurple
                      ? AppColor.borderColor
                      : AppColor.primaryColor,
                  onClick: () {
                    if (selectboxViewModel.selectedButtonIndex != -1) {
                      selectboxViewModel.clearSelection();
                    } else {
                      selectboxViewModel.selectButton(0);
                    }
                    Navigator.pushNamed(context, Routes.result);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
