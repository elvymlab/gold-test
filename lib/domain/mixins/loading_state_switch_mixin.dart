import 'package:flutter/widgets.dart';

mixin LoadingStateSwitch implements ChangeNotifier {
  int _loadingRequestsCount = 0;

  bool get isLoading => _loadingRequestsCount != 0;

  void turnLoading({required bool isOn}) {
    final previousLoadingState = isLoading;
    if (isOn) {
      _loadingRequestsCount++;
    } else {
      _loadingRequestsCount--;
    }
    if (previousLoadingState != isLoading) {
      notifyListeners();
    }
  }
}
