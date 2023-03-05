import 'package:assignment_one/text_output.dart';
import 'package:flutter/material.dart';

class TextControl extends StatefulWidget {
  const TextControl({super.key});

  @override
  State<TextControl> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = 'This is the first assignment';


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () {
          setState(() {
            _mainText = 'This changed!';
          });
        },
        child: const Text('Change Text'),
      ),
      TextOutput(mainText: _mainText)
      
    ]);
  }
}
