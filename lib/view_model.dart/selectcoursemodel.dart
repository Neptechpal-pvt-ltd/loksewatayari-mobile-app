import 'package:flutter/material.dart';
import 'package:loksewa/core/themes/app_color.dart';

class CourseSelectionModel extends ChangeNotifier {
  bool _showOngoingCourses = true;
  Color _ongoingCoursesColor = AppColor.primaryColor; // Set your desired color
  Color _completedCoursesColor = Colors.black;

  bool get showOngoingCourses => _showOngoingCourses;
  Color get ongoingCoursesColor => _ongoingCoursesColor;
  Color get completedCoursesColor => _completedCoursesColor;

  void setShowOngoingCourses(bool value) {
    _showOngoingCourses = value;
    _ongoingCoursesColor = value ? AppColor.primaryColor : Colors.black;
    _completedCoursesColor = value ? Colors.black : AppColor.primaryColor;
    notifyListeners();
  }
  
}
