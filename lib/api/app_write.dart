import 'dart:developer';

import 'package:ai_assistant/helper/apiKey.dart';
import 'package:appwrite/appwrite.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('66e2af5100140e1d1ec9')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: 'MyDatabase',
          collectionId: 'ApiKey',
          documentId: 'geminiApiKey');

      apiKey = d.data['apiKey'];
      log('ApiKey: $apiKey');
      return apiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}
