import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/splash__screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Pref.initialize();
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
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              elevation: 5,
                centerTitle: true,
                titleTextStyle:
                    TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.w500))),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
