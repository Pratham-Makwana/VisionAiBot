import 'package:ai_assistant/helper/ad_helper.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
        color: Colors.blue.withOpacity(.2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 1,
        margin: EdgeInsets.only(bottom: mq.height * .02),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          // onTap: homeType.onTap,
          /// showing the facebook ads & in parameter its accept the callback function of the that which screen to move
          onTap: () => AdHelper.showInterstitialAd(homeType.onTap),
          child: homeType.leftAlign
              ? Row(
                  children: [
                    /// lottie image
                    Container(
                      padding: homeType.padding,
                      width: mq.width * .35,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                    ),

                    /// for adding space
                    const Spacer(),

                    /// title
                    Text(
                      homeType.title,
                      style: const TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),

                    /// for adding space
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                )
              : Row(
                  children: [
                    /// for adding space
                    const Spacer(
                      flex: 2,
                    ),

                    /// title
                    Text(
                      homeType.title,
                      style: const TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),

                    /// for adding space
                    const Spacer(),

                    /// lottie image
                    Container(
                      width: mq.width * .35,
                      padding: homeType.padding,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                    ),
                  ],
                ),
        )).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}
