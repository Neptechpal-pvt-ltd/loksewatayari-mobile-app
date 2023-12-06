import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
// ignore: unused_import
import 'package:loksewa/main.dart';
import 'package:loksewa/view/community/community_view.dart';
import 'package:loksewa/view/home_view/homepage.dart';
import 'package:loksewa/view/profile/profile_view.dart';
import 'package:loksewa/view/quiz/quizview.dart';
import 'package:loksewa/view/resources/resource_view.dart';

class DashboardViewModel extends ChangeNotifier {
  List<Widget> pages = [
    HomePage(),
    const QuizView(),
    const CommunityView(),
   const  ResourcesView(),
     ProfileView(),
  ];
  List<String> imagePaths = [
    AssetsPath.homesvg,
    AssetsPath.quizsvg,
    AssetsPath.communitysvg,
    AssetsPath.resourcesvg,
    AssetsPath.profilesvg,
  ];
  List<String> bottontext = [
    "Home",
    "Quiz",
    "Community",
    "Resources",
    "Profile",
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  updateIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  navigate(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Column(
        children: [
          pages[index],
          Text(
            bottontext[index],
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    ));
  }
}
