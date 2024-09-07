import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 1,
      child: Row(
        children: [
          Lottie.asset('assets/lottie/ai_hand_waving.json',
              width: mq.width * .35),
          const Spacer(),

          /// title
          const Text(
            'Ai ChatBot',
            style: TextStyle(
                letterSpacing: 1, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
