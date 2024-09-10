import 'package:ai_assistant/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  /// text controller for chatbot_feature screen  input field
  final textController = TextEditingController();

  final list = <Message>[].obs;

  void askQuestion() {
    if (textController.text.trim().isNotEmpty) {
      list.add(Message(msg: textController.text, msgType: MessageType.user));
      
      list.add(Message(msg: 'I received your message', msgType: MessageType.bot));

      textController.text = '';
    }
  }
}
