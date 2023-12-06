import 'package:flutter/material.dart';

class SelectboxViewModel extends ChangeNotifier{
  final TextEditingController _selectCareer = TextEditingController();
  TextEditingController get careerController => _selectCareer;
  int selectedButtonIndex = -1;

  
  
     updateCareerController(String value) {
    careerController.text = value;
    notifyListeners();
  }
void  selectButton(int index) {
    selectedButtonIndex = index;
    notifyListeners();
  }
  void clearSelection() {
    selectedButtonIndex = -1;
    notifyListeners();
  }
  }

