import 'package:ai_assistant/api/apis.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  /// text controller for chatbot_feature screen  input field
  final textController = TextEditingController();

  final list = <Message>[Message(msg: 'Hello, How can I Help You?', msgType: MessageType.bot)].obs;

  Future<void> askQuestion() async {
    if (textController.text.trim().isNotEmpty) {
      list.add(Message(msg: textController.text, msgType: MessageType.user));
      list.add(Message(msg: 'Please Wait', msgType: MessageType.bot));

      final res = await APIs.getAnswer(textController.text);

      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));

      textController.text = '';
    }
  }
}
