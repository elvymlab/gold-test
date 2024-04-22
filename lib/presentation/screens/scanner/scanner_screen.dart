import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold_test/presentation/screens/scanner/state/scanner_screen_state.dart';
import 'package:gold_test/presentation/screens/scanner/widgets/overlay_with_rectangle_clipping.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _BarcodeScannerWithControllerState();
}

class _BarcodeScannerWithControllerState extends State<ScannerScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<ScannerScreenState>().init();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    context.read<ScannerScreenState>().didChangeLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScannerScreenState>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: state.controller,
            errorBuilder: (context, error, child) {
              return const SizedBox.shrink();
            },
            fit: BoxFit.contain,
            onDetect: (barcodes) {},
          ),
          const OverlayWithRectangleClipping(),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
