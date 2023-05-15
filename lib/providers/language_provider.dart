import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _language = Locale("en");

  Locale get language => _language;

  set language(Locale newLanguage) {
    _language = newLanguage;
    notifyListeners();
  }
}
