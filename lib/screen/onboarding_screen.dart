import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// lottie
          Lottie.asset('assets/lottie/ai_ask_me.json', height: mq.height * .6),

          /// title
          const Text(
            'Ask me Anything',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0.5),
          ),

          /// for adding some space
          SizedBox(
            height: mq.height * .01,
          ),

          /// subtitle
          SizedBox(
              width: mq.width * .7,
              child: const Text(
                'I can be your Best Friend & You can ask me anything & I will help you!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5, letterSpacing: 0.5),
              )),

          /// for adding some space
          const Spacer(),
          /// dots
          Wrap(
            spacing: 10,
            children: List.generate(
                2,
                (i) => Container(
                      width: 10,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
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
              onPressed: () {},
              child: const Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              )),
          /// for adding some space
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
