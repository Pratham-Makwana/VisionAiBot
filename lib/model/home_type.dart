import 'package:ai_assistant/screen/feature/chatbot_feature.dart';
import 'package:ai_assistant/screen/feature/image_feature.dart';
import 'package:ai_assistant/screen/feature/translator_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// enum -> Special Variable With Predefined Constant Value (more like an Placeholder)
enum HomeType { aiChatBot, aiImage, aiTranslator }

/// creating the extension function on homeType
extension MyHomeType on HomeType {
  /// we can override the method that we wish
  /// this method return the title depending upon the enum
  /// this -> this represent the enum that which is calling this function

  /// title
  String get title => switch (this) {
        HomeType.aiChatBot => "AI ChatBot",
        HomeType.aiImage => "AI Image Creator",
        HomeType.aiTranslator => "Language Translator",
      };

  /// lottie
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'ai_hand_waving.json',
        HomeType.aiImage => 'ai_play.json',
        HomeType.aiTranslator => 'ai_ask_me.json',
      };

  /// for alignment
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };

  /// for padding
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImage => const EdgeInsets.all(20),
        HomeType.aiTranslator => EdgeInsets.zero,
      };
/// for navigation
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => const ChatBotFeature()),
        HomeType.aiImage => () => Get.to(() => const ImageFeature()),
        HomeType.aiTranslator => () => Get.to(() => const TranslatorFeature()),
      };
}
