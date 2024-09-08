import 'package:flutter/material.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
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
                onPressed: () {},
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
      body: ListView(
        children: [],
      ),
    );
  }
}
