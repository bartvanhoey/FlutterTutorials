import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final Function buttonPressHandler;
  final String buttonText;

  const AdaptiveTextButton({super.key, required this.buttonText, required this.buttonPressHandler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child:  Text(buttonText,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            onPressed: () => buttonPressHandler())
        : TextButton(
            style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.purple)),
            onPressed: () => buttonPressHandler(),
            child:  Text(buttonText,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          );
  }
}
