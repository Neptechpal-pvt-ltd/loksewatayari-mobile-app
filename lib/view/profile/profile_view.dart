import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/core/themes/app_color.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';

class ProfileView extends StatelessWidget {
  List<String> profileAccount = [
    'Edit Account',
    'Track my Progress',
    'Transaction History',
    'Dark Mode',
    'Notification Settings',
  ];
  List<String> profileGeneral = [
    'Invite Friends',
    'Language',
    'About App',
    'Privacy Policy',
    'Rate Our App',
    'Share Our App',
    'Help & Support',
    'Logout',
  ];
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            children: [
              const CustomAppbar(
                text: "Profile",
              ),
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AssetsPath.profile),
              ),
              const Text(
                "Bryan Adam",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff151B28)),
              ),
              const Text(
                "bryan.adam87@gmail.com",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff576D7E)),
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
                        child: Container(
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
                                  child:
                                      const Center(child: Text("Unlock Now")),
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
           const    Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff49556D)),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.35,
                child: ListView.builder(
                    itemCount: profileAccount.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.pushNamed(context, Routes.editAccount);

                            case 1:
                              Navigator.pushNamed(
                                  context, Routes.trackProgress);
                          }
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: SvgPicture.asset(
                                            AssetsPath().profileAccount[index]),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(profileAccount[index]),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:
                                        Icon(Icons.arrow_forward_ios_outlined),
                                  )
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "General",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff49556D)),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.70,
                child: ListView.builder(
                    itemCount: profileGeneral.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: SvgPicture.asset(
                                          AssetsPath().profileGeneral[index]),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(profileGeneral[index]),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                )
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
