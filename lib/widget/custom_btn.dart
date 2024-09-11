import 'package:flutter/material.dart';
import '../helper/global.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomBtn({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(mq.width * .4, 50),
              backgroundColor: Colors.blue,
              shape: const StadiumBorder(),
              elevation: 0),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
          )),
    );
  }
}
