import 'package:ai_assistant/api/app_write.dart';
import 'package:ai_assistant/helper/ad_helper.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/splash__screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init hive
  Pref.initialize();

  /// for appwrite initialization
  //AppWrite.init();

  /// for initialization facebook ads sdk
  AdHelper.init();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: appName,
        themeMode: Pref.defaultTheme(),

        ///dark
        darkTheme: ThemeData(
            useMaterial3: false,
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              elevation: 1,
              centerTitle: true,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),

        /// light
        theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              elevation: 1,
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.blue),
              titleTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}

extension AppTheme on ThemeData {
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;

  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}
