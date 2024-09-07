import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final list = [
      /// OnBoarding 1
      OnBoard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help you!',
          lottie: 'ai_ask_me'),
      OnBoard(
          title: 'Imagination To Reality',
          subtitle:
              'Just Imagine anything & let me know , I will create something wonderful for you',
          lottie: 'ai_play')
    ];
    return Scaffold(
        body: PageView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final isLast = index == list.length - 1;
        return Column(
          children: [
            /// lottie
            Lottie.asset('assets/lottie/${list[index].lottie}.json',
                height: mq.height * .6, width: isLast ? mq.width * .8 : null),

            /// title
            Text(
              list[index].title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5),
            ),

            /// for adding some space
            SizedBox(
              height: mq.height * .01,
            ),

            /// subtitle
            SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[index].subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13.5, letterSpacing: 0.5),
                )),

            /// for adding some space
            const Spacer(),

            /// dots
            Wrap(
              spacing: 10,
              children: List.generate(
                  list.length,
                  (i) => Container(
                        width: i == index ? 15 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                          color: i == index ? Colors.blue : Colors.grey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                      )),
            ),

            /// for adding some space
            const Spacer(),

            /// Button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(mq.width * .4, 50),
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                    elevation: 0),
                onPressed: () {
                  if (isLast) {
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (_) => const HomeScreen()));
                    Get.off(() => const HomeScreen());

                  } else {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
                child: Text(
                  isLast ? 'Finish' : 'Next',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                )),

            /// for adding some space
            const Spacer(
              flex: 2,
            ),
          ],
        );
      },
    ));
  }
}
