import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localizationStateManagerProvider =
    StateNotifierProvider<LocalizationStateManager, Locale?>((ref) {
  return LocalizationStateManager(ref);
});

class LocalizationStateManager extends StateNotifier<Locale?> {
  LocalizationStateManager(this.read, [state]) : super(state) {
    _init();
  }

  final Ref read;

  void _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Locale? locale;
    var jsonData = prefs.getString('locale') ?? '';
    if (jsonData != '') {
      locale = Locale.fromSubtags(languageCode: jsonData);
    }
    state = locale;
  }

  Future<void> switchLanguage(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', lang);
    state = Locale.fromSubtags(languageCode: lang);
  }
}
