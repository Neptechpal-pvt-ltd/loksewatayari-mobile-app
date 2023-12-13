import 'package:flutter/material.dart';
import 'package:loksewa/core/const/app_string.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/view_model.dart/selectcareer_view_model.dart';
import 'package:provider/provider.dart';

class SelectCareer extends StatelessWidget {
  int selectedButtonIndex = -1;
  void selectButton(int index) {
    selectedButtonIndex = index;
  }

  var jsonData = [];

  SelectCareer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SelectboxViewModel>(context, listen: false).getData();
    final selectboxViewModel = Provider.of<SelectboxViewModel>(context);

    bool isContinueButtonPurple = selectboxViewModel.selectedButtonIndex != -1;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppbar(),
            const Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(image: AssetImage(AssetsPath.career)),
                    ),
                    Text(
                      AppString.selectCareer,
                      style: TextStyle(
                        color: AppColor.credentialName,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        AppString.careerdes,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.textFieldTextColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 8,
                child: jsonData != null
                    ? GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(jsonData.length, (index) {
                          print(
                            jsonData[index]['title'],
                          );
                          final isSelected =
                              index == selectboxViewModel.selectedButtonIndex;
                          return InkWell(
                            onTap: () {
                              selectboxViewModel.selectButton(index);
                            },
                            child: Container(
                              height: 100,
                              width: 171,
                              decoration: BoxDecoration(
                                  color:
                                      isSelected ? AppColor.primaryColor : null,
                                  // color: texts[index]['isSelected']
                                  //     ? AppColor.primaryColor
                                  //     : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: AppColor.borderColor)),
                              margin: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  jsonData[index]['title'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: isSelected
                                          ? AppColor.borderColor
                                          : Colors.black),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    : Center(child: CircularProgressIndicator())),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.course);
              },
              child: NavButton(
                btnText: "Continue",
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
                  Navigator.pushNamed(context, Routes.course);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
