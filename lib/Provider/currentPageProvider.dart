import 'package:flutter/cupertino.dart';

class CurrentPage extends ChangeNotifier {
  int currentPage = 0;
  int get getCurrentPage => currentPage;
  void changeCurrentPage(int no) {
    currentPage = no;
    notifyListeners();
  }
}
