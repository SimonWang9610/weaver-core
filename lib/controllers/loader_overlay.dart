import 'package:flutter/material.dart';

class LoaderOverlayController {
  static final instance = LoaderOverlayController._();

  LoaderOverlayController._();

  LoaderSetting setting = const LoaderSetting();

  OverlayEntry? _entry;

  OverlayEntry _createOverlayEntry(Widget? child) {
    return OverlayEntry(
      builder: (BuildContext context) {
        return WillPopScope(
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(
              setting.backgroundOpacity,
            ),
            body: Center(
              child: child ?? const CircularProgressIndicator(),
            ),
          ),
          onWillPop: () async {
            return Future.value(setting.enableWillPop);
          },
        );
      },
    );
  }

  void show(BuildContext context, {Widget? child}) {
    assert(_entry == null);
    _entry = _createOverlayEntry(child);
    Overlay.of(context)?.insert(_entry!);
  }

  void hide() {
    _entry?.remove();
    _entry = null;
  }
}

class LoaderSetting {
  final double backgroundOpacity;
  final bool enableWillPop;
  final bool dismissible;

  const LoaderSetting({
    this.backgroundOpacity = 0.7,
    this.enableWillPop = false,
    this.dismissible = false,
  });
}
