import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';
import 'package:loksewa/view_model.dart/selectcareer_view_model.dart';
import 'package:provider/provider.dart';

class ResourcesView extends StatelessWidget {
  const ResourcesView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectboxViewModel = Provider.of<SelectboxViewModel>(context);

    bool isContinueButtonPurple = selectboxViewModel.selectedButtonIndex != -1;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            CustomAppbar(
              text: "Resources",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Latest News",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:
                        isContinueButtonPurple ? AppColor.primaryColor : null,
                  ),
                ),
                Text("Gorkha Patra"),
                Text("Vacancy Posts")
              ],
            ),
            Divider(),
            SizedBox(
              width: 390,
              height: 169,
              child: Stack(
                children: <Widget>[
                  const Image(image: AssetImage(AssetsPath.resource)),
                  Positioned(
                    top: 100,
                    // bottom: 5,
                    left: 20,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: 319,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "Today's Fresh Objective Questions and Answers on Public Services.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "All News",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff151B2B),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Replace with your actual item count
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff101828)
                              .withOpacity(0.1), // Shadow color
                          spreadRadius: 0, // How much to spread the shadow
                          blurRadius: 8, // How much to blur the shadow
                          offset: Offset(
                              0, 4), // Changes the position of the shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetsPath.loksewaTayari,
                          height: MediaQuery.sizeOf(context).height * 0.12,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "May 16, 2021",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff49556D),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Today's Fresh Objective Questions and Answers on Public Services",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color(0xff151B2B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
