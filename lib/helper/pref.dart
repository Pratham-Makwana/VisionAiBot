import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// Preference of the application
class Pref {
  static late Box _box;

  static Future<void> initialize() async {
    /// for initializing hive to use app directory
    /// In Hive Everything is box and we can store any data in box
    /// we have to create and open a box  to store data in hive

    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    _box = Hive.box(name: 'myData');

    // await Hive.initFlutter();
    // _box = await Hive.openBox('myData');
  }

  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: true);

  static set showOnboarding(bool v) => _box.put('showOnboarding', v);

  // Normal Way - Get
  // how to call
  // showOnboarding()

  // static bool showOnboarding() {
  //   return _box.get('showOnboarding', defaultValue: true);
  // }

  // Normal Way - Set
  // how to call
  // showOnboarding(false)

  // static bool showOnboarding(bool v) {
  //   _box.put('showOnboarding', v);
  // }

  /// for storing theme data
  static bool get isDarkMode => _box.get('isDarkMode') ?? false;

  static set isDarkMode(bool v) => _box.put('isDarkMode', v);

  static ThemeMode defaultTheme() {
    final date = _box.get('isDarkMode');
    log('data: $date');
    if (date == null) return ThemeMode.system;
    if (date == true) return ThemeMode.dark;
    return ThemeMode.light;
  }
}
