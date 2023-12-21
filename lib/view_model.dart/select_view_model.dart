// import 'package:flutter/material.dart';

// class SelectedViewModel extends ChangeNotifier {
//   final List<Map> texts = [
//     {'title': "+2", 'isSelected': false},

//     {'title': "Bachelor", 'isSelected': false},
//     {'title': "Bachelor", 'isSelected': false},
//     {'title': "Bachelor", 'isSelected': false},
//     {'title': "Bachelor", 'isSelected': false},
//     {'title': "Bachelor", 'isSelected': false},

//     // '+2',
//     // 'Bachelors',
//     // '3 Years Diploma',
//     // 'Licensure Exam',
//     // 'Loksewa Aayog',
//     // 'Loksewa Aayog',
//   ];

//   changeSelected(int value) {
//     texts[value]['isSelected'] = true;
//     for (int i = 0; i < texts.length; i++) {
//       if (i != value) {
//         texts[value]['isSelected'] = false;
//       }
//     }
//     notifyListeners();
//   }
// }
