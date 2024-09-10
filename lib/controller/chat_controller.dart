import 'package:ai_assistant/api/apis.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/my_dialog.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  /// text controller for chatbot_feature screen  input field
  final textController = TextEditingController();

  final scrollController = ScrollController();

  final list = <Message>[
    Message(msg: 'Hello, How can I Help You?', msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if (textController.text.trim().isNotEmpty) {
      //user
      list.add(Message(msg: textController.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.bot));
      _scrollDown();

      final res = await APIs.getAnswer(textController.text);

      //ai bot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();

      textController.text = '';
    } else {
      MyDialog.info('Ask Something!');
    }
  }

  ///for moving to end message
  void _scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

}
