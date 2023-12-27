// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/buttons/buttonnav_bar.dart';
import 'package:loksewa/view_model.dart/dashboard_view_model.dart';

import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DashboardViewModel dashboardViewModels =
        Provider.of<DashboardViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Consumer<DashboardViewModel>(builder: (_, dashboardViewModel, __) {
        return Stack(
          children: [
            dashboardViewModel.pages[dashboardViewModel.currentIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 216, 208, 208)
                              .withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 32,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                          dashboardViewModels.imagePaths.length, (index) {
                        return ButtonNavbar(
                          onClick: () {
                            dashboardViewModels.updateIndex(index);
                          },
                          icon: Column(
                            children: [
                              SvgPicture.asset(
                                dashboardViewModels.imagePaths[index],
                                // ignore: deprecated_member_use
                                color: dashboardViewModels.currentIndex == index
                                    ? AppColor.primaryColor
                                    : const Color(0xff49556D),
                              ),
                              Text(
                                dashboardViewModels.bottontext[index],
                                style: TextStyle(
                                  fontWeight:
                                      dashboardViewModels.currentIndex == index
                                          ? FontWeight.w500
                                          : FontWeight.w400,
                                  color:
                                      dashboardViewModels.currentIndex == index
                                          ? AppColor.primaryColor
                                          : const Color(0xff49556D),
                                ),
                              )
                            ],
                          ),
                          index: index,
                        );
                      }))),
            )
          ],
        );
      }),
    );
  }
}
