import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/screen/onboarding_screen.dart';
import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/global.dart';

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
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (_) => Pref.showOnboarding ?  const OnboardingScreen() : const HomeScreen()));
      Get.off(() =>
          Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    /// initializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      /// body
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            /// for adding some space
            const Spacer(
              flex: 2,
            ),

            /// logo
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  'assets/images/chatbot.png',
                  width: mq.width * .4,
                ),
              ),
            ),

            /// for adding some space
            const Spacer(),

            /// lottie loading
            const CustomLoading(),

            /// for adding some space
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
