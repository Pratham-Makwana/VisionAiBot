import 'dart:developer';

import 'package:ai_assistant/controller/translate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/global.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController controller;
  final RxString string;

  const LanguageSheet(
      {super.key, required this.controller, required this.string});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * .5,
      padding: EdgeInsets.only(
          top: mq.height * .02, left: mq.width * .04, right: mq.width * .04),
      decoration:  BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor ,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: Column(
        children: [
          TextFormField(
            //controller: _controller.resultController,
            onChanged: (s) => _search.value = s.toLowerCase(),
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.translate_rounded,
                  color: Colors.blue,
                ),
                hintText: 'Search Language...',
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          Expanded(
            child: Obx(
              () {
                final List<String> list = _search.isEmpty
                    ? widget.controller.lang
                    : widget.controller.lang
                        .where((e) => e.toLowerCase().contains(_search.value))
                        .toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: mq.height * .02, left: 6),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.string.value = list[index];
                        log(list[index]);
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: mq.height * .02),
                        child: Text(list[index]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
