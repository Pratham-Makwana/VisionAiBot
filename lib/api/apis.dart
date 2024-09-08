import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../helper/apiKey.dart';

class APIs {
  /// get answer for chat gpt
  /// Bearer is required most jwt(json web token) authorization feature
  ///

  static Future<String> getAnswer(String question) async {
    try {
      log('api key: $apiKey');

      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );
      final content = [Content.text(question)];
      final res = await model.generateContent(content, safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      ]);
      log('res:${res.text}');
      return res.text!;
    } catch (e) {
      log('getAnswerGeminiE : $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }
}
