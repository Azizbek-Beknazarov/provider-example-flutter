import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness _systemBrightness =
      SchedulerBinding.instance.window.platformBrightness;

  Brightness get getCustomBrightness => _systemBrightness;

  set setCustomTheme(Brightness newCustomBrightness) {
    _systemBrightness = newCustomBrightness;
    notifyListeners();
  }
}
