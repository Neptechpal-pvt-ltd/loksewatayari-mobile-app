import 'dart:async';

import 'package:flutter/material.dart';

import '../model/syllabus_structure.dart';
import '../repositories/data_repository.dart';
enum DownloadState { loading, success, error }

class MockTestViewModel extends ChangeNotifier {

  List<SyllabusStructure>? syllabusStructure;
   DownloadState downloadState = DownloadState.loading;
  late int totalQuestion;
  int counter = 12;
  late Timer _timer;
  void timer() {
    const oneSec = Duration(seconds: 5);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (counter == 0) {
          timer.cancel();
          // Countdown completed, do something here
        } else {
          counter=counter-1;
        }
          notifyListeners();

      },
    );
  }


   void getUsers() async {
    syllabusStructure = await DataRepository().getSyllabusStructure("clhubp5rk0008bug8wplt62s2");
    if (syllabusStructure == null) {
      //something went wrong while loading clubs
      downloadState = DownloadState.error;
      notifyListeners();
      
      return;
    }
    downloadState = DownloadState.success;
    print("APi Fetch date");
    print(syllabusStructure);
  }
}
