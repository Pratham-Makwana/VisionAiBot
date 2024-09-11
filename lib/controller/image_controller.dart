import 'dart:developer';
import 'dart:io';

import 'package:ai_assistant/api/apis.dart';
import 'package:ai_assistant/helper/apiKey.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }

  void downloadImage() async {
    try {
      // To Show Loading
      MyDialog.showLoadingDialog();

      log('url: $url');

      // 1.use  http to download image bytes
      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      // 2. Path Provider to store those bytes as image in temp directory
      final dir = await getTemporaryDirectory();
      // 3. creating a file called ai_image.png & writing all the bytes in it

      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filepath : ${file.path}');

      // 4. Using Gallery Saver With that path to store it in Gallery
      // Save the Image To Gallery
      await GallerySaver.saveImage(file.path, albumName: appName)
          .then((success) {
        // hide loading
        Get.back();
        MyDialog.success('Image Download to Gallery!');
      });
    } catch (e) {
      Get.back();
      MyDialog.error('Something Went Wrong (Try again in sometime');
      log('downloadImageE: $e');
    }
  }

  void shareImage() async {
    try {
      // To Show Loading
      MyDialog.showLoadingDialog();

      log('url: $url');

      // 1.use  http to download image bytes
      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      // 2. Path Provider to store those bytes as image in temp directory
      final dir = await getTemporaryDirectory();
      // 3. creating a file called ai_image.png & writing all the bytes in it
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filepath : ${file.path}');

      /// hide loading
      Get.back();
      await Share.shareXFiles([XFile(file.path)],
          text:
              'Check Out The Amazing Image Created by VisionAi By Pratham Makwana');
    } catch (e) {
      /// hide loading
      Get.back();
      MyDialog.error('Something Went Wrong (Try again in sometime');
      log('downloadImageE: $e');
    }
  }
}
