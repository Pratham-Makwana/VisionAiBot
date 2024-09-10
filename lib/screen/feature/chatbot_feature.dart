import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            /// text input field

            Expanded(
                child: TextFormField(
              controller: _controller.textController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Ask me anything you want...',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
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
          children: _controller.list.map((e) => Text(e.msg)).toList(),
        ),
      ),
    );
  }
}
