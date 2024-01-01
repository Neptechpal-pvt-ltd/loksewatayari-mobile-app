import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/core/const/app_string.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/model/select_careers_modal.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/utils/widgets/buttons/nav_button.dart';
import 'package:loksewa/view_model.dart/selectcareer_view_model.dart';
import 'package:provider/provider.dart';

class SelectCourse extends StatelessWidget {
  int selectedButtonIndex = -1;

  void selectButton(int index) {
    selectedButtonIndex = index;
  }

  SelectCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectboxViewModel = Provider.of<SelectboxViewModel>(context);
    bool isContinueButtonPurple = selectboxViewModel.selectedButtonIndex != -1;

    return Consumer<SelectboxViewModel>(
      builder: (context, selectedViewModel, child) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const CustomAppbar(),
                const Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage(AssetsPath.career)),
                      ),
                      Text(
                        AppString.selectCourse,
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
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Consumer<SelectboxViewModel>(
                    builder: (context, selectboxViewModel, _) {
                      return FutureBuilder<List<Selectcareers>>(
                        future: selectboxViewModel.getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('error:${snapshot.error}');
                          } else {
                            List<Selectcareers> careers = snapshot.data ?? [];
                            if (kDebugMode) {
                              // print(careers[0].subServices!.length);
                            }
                            final indexs =
                                Provider.of<SelectboxViewModel>(context)
                                    .getindex;
                            return ListView.builder(
                              itemCount: careers[indexs].subServices!.length,
                              itemBuilder: (context, index) {
                                final isSelected = index ==
                                    selectboxViewModel.selectedButtonIndex;
                                return GestureDetector(
                                  onTap: () {
                                    selectboxViewModel.selectButton(index);

                                    selectboxViewModel.setcarrertitle(
                                        careers[indexs]
                                            .subServices![indexs]
                                            .title!);
                                  },
                                  child: Container(
                                    height: 56,
                                    width: 358,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColor.primaryColor
                                          : null,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: AppColor.borderColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 13),
                                      child: Text(
                                        careers[indexs]
                                            .subServices![indexs]
                                            .title!,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isSelected
                                              ? AppColor.borderColor
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                NavButton(
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
                    Navigator.pushNamed(context, Routes.dashboard);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
