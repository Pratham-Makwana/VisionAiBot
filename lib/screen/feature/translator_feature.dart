import 'package:flutter/material.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: AppBar(
        title: const Text('Multi Language Translator'),
      ),

      /// body
      body: ListView(
        children: [],
      ),
    );
  }
}
