import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class OpenCloseRestaurant extends ChangeNotifier {
  bool isOpen = true;
  bool isClosed = false;
  bool isBusy = false;
  bool get busy => isBusy;
  bool get open => isOpen;
  bool get closed => isClosed;

  void changeStatus(
    bool busy,
    bool open,
    bool close,
  ) {
    isOpen = open;
    isClosed = close;
    isBusy = busy;
    notifyListeners();
  }
}
