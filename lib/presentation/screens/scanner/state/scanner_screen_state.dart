import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:gold_test/presentation/navigation/navigators/app_navigator.dart';
import 'package:gold_test/presentation/navigation/routes/catalog_routes.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@injectable
class ScannerScreenState extends ChangeNotifier {
  ScannerScreenState({required AppNavigator appNavigator}) : _appNavigator = appNavigator {
    init();
  }

  final AppNavigator _appNavigator;

  MobileScannerController? controller;
  Barcode? _barcode;
  StreamSubscription<Object?>? subscription;

  bool get isButtonEnable => _barcode != null;

  Barcode? get barcode => _barcode;

  @override
  void dispose() {
    unawaited(subscription?.cancel());
    subscription = null;
    _barcode = null;
    super.dispose();
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    _barcode = barcodes.barcodes.firstOrNull;
    notifyListeners();
  }

  void init() {
    controller = MobileScannerController(useNewCameraSelector: true);
    subscription = controller?.barcodes.listen(_handleBarcode);
    unawaited(controller?.start());
  }

  void didChangeLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        subscription = controller?.barcodes.listen(_handleBarcode);

        unawaited(
          controller?.start(),
        );
      case AppLifecycleState.inactive:
        unawaited(subscription?.cancel());
        subscription = null;
        unawaited(
          controller?.stop(),
        );
    }
  }

  void onGoToResultButtonPressed() {
    final code = barcode?.displayValue;
    if (code != null) {
      _barcode = null;
      notifyListeners();
      _appNavigator.pushRoute(
        OfferRoute(barcode: code),
      );
    }
  }
}
