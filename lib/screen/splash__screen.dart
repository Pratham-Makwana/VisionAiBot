import 'package:flutter/material.dart';

import '../helper/global.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    /// initializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: mq.width * .45,
        ),
        /*child: Card(
          color: Colors.deepPurple,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: EdgeInsets.all(mq.width * .05),
            child: Image.asset('assets/images/chatbot.png', width: mq.width * .4),
          ),
        ),*/
      ),
    );
  }
}
