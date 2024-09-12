import 'package:ai_assistant/controller/translate_controller.dart';
import 'package:ai_assistant/widget/custom_btn.dart';
import 'package:ai_assistant/widget/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/image_controller.dart';
import '../../helper/global.dart';
import '../../widget/custom_loading.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _controller = TranslateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: AppBar(
        title: const Text('Multi Language Translator'),
      ),

      /// body
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * .02,
          bottom: mq.height * .1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// from language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  controller: _controller,
                  string: _controller.from,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Obx(
                    () => Text(_controller.from.isEmpty
                        ? 'Auto'
                        : _controller.from.value),
                  ),
                ),
              ),

              ///swipe language btn
              IconButton(
                  onPressed: _controller.swapLanguages,
                  icon: Obx(
                    () => Icon(
                      CupertinoIcons.repeat,
                      color: _controller.to.isNotEmpty &&
                              _controller.from.isNotEmpty
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  )),

              /// to language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                    controller: _controller, string: _controller.to)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Obx(
                    () => Text(
                        _controller.to.isEmpty ? 'To' : _controller.to.value),
                  ),
                ),
              ),
            ],
          ),

          /// text field
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .035),
            child: TextFormField(
              controller: _controller.textController,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  hintText: 'Translate anything you want......',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),

          /// result field
          Obx(() => _translateResult()),

          /// for adding some space
          SizedBox(
            height: mq.height * .04,
          ),

          /// translate Button
          CustomBtn(
            onTap: _controller.googleTranslate,
            // onTap: _c.translate,
            text: 'Translate',
          )
        ],
      ),
    );
  }

  Widget _translateResult() => switch (_controller.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            child: TextFormField(
              controller: _controller.resultController,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        Status.loading => const Align(child: CustomLoading())
      };
}
