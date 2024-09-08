import 'package:ai_assistant/api/apis.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:ai_assistant/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    /// initializing device size
    mq = MediaQuery.sizeOf(context);

    //sample api call
    // APIs.getAnswer('hii');
    return Scaffold(
      backgroundColor: Colors.white,

      /// appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(appName),

        /// actions
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {},
              icon: const Icon(
                Icons.brightness_4_rounded,
                //color: Colors.blue,
                size: 26,
              ))
        ],
      ),

      /// body
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .015),
        children: HomeType.values
            .map((e) => HomeCard(
                  homeType: e,
                ))
            .toList(),
      ),
    );
  }
}
