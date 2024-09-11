import 'package:ai_assistant/api/apis.dart';
import 'package:ai_assistant/helper/apiKey.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/my_dialog.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  /// text controller for chatbot_feature screen  input field
  final textController = TextEditingController();

  final status = Status.none.obs;

  final url = ''.obs;

  final imageList = <String>[].obs;

  /// for chatgpt api key
  Future<void> createAIImage() async {
    OpenAI.apiKey = apiKey;
    if (textController.text.trim().isNotEmpty) {
      status.value = Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: textController.text,
        n: 1,
        size: OpenAIImageSize.size512,
        responseFormat: OpenAIImageResponseFormat.url,
      );

      url.value = image.data[0].url.toString();

      textController.text = '';

      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }

  Future<void> searchAiImage() async {
    /// if prompt is not empty
    if (textController.text.trim().isNotEmpty) {
      status.value = Status.loading;
      imageList.value = await APIs.searchAiImages(textController.text);

      if (imageList.isEmpty) {
        MyDialog.error('something went wrong (try again in sometime');
        return;
      }
      url.value = imageList.first;
      status.value = Status.complete;
      textController.text = '';
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }
}
