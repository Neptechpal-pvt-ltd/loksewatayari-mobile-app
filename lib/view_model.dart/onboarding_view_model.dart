import 'package:flutter/material.dart';

class OnboardViewModel extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void changePage(int page) {
    _currentPage = page;
    notifyListeners();
  }


}
