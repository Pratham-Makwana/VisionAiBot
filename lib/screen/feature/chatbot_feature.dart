import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/widget/message_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';

//
class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  /// it create the single instance and use this instance in anyScreen by Get.find() method
  /// Get.put() and Get.find() to use same controller in different screen
  // final _controller = Get.put(ChatController());

  /// it create one instance for one screen only
  final _controller = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: AppBar(
        title: const Text('Chat With Ai Assistant'),
      ),
      ///send message field & btn
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            /// text input field
            Expanded(
                child: TextFormField(
              controller: _controller.textController,
              textAlign: TextAlign.center,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me anything you want...',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            )),

            /// for adding some space
            const SizedBox(
              width: 8,
            ),

            /// send button
            CircleAvatar(
              radius: 24,
              child: IconButton(
                onPressed: _controller.askQuestion,
                icon: const Icon(
                  Icons.rocket_launch_rounded,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),

      /// body
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _controller.scrollController,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children:
              _controller.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}




