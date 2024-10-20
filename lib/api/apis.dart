import 'dart:convert';
import 'dart:developer';
import 'package:ai_assistant/api/apiKey.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart';
import 'package:translator_plus/translator_plus.dart';
class APIs {
  /// get answer for chat gpt
  /// Bearer is required most jwt(json web token) authorization feature

  /// ChatBot Feature
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

  /// Image Feature
  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final date = jsonDecode(res.body);

      return List.from(date['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }

  // static Future<String> googleTranslate(
  //     {required String to, required String from, required String text}) async {
  //   try {
  //     final res = await GoogleTranslator().translate(text, from: from, to: to);
  //
  //     return res.text;
  //   } catch (e) {
  //     log('googleTranslateE: $e ');
  //     return 'Something went wrong';
  //   }
  // }

  static Future<String> googleTranslate(
      {required String from, required String to, required String text}) async {
    try {
      final res = await GoogleTranslator().translate(text, from: from, to: to);

      return res.text;
    } catch (e) {
      log('googleTranslateE: $e ');
      return 'Something went wrong!';
    }
  }


}
