import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SelectboxViewModel extends ChangeNotifier {
  final TextEditingController _selectCareer = TextEditingController();
  TextEditingController get careerController => _selectCareer;
  int selectedButtonIndex = -1;

  updateCareerController(String value) {
    careerController.text = value;
    notifyListeners();
  }

  void selectButton(int index) {
    selectedButtonIndex = index;
    notifyListeners();
  }

  void clearSelection() {
    selectedButtonIndex = -1;
    notifyListeners();
  }
    List<Map<String, dynamic>>? jsonData;

  void getData() async {
    try {
      var response = await Dio().get("https://loksewa.cb-ashik.me/sewaservice");
      if (response.statusCode == 200) {
        jsonData = List<Map<String, dynamic>>.from(response.data);
        notifyListeners();
      } else {
        print('failed to fetch data:${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}


