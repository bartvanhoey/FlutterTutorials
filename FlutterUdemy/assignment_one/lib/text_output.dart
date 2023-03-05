import 'package:flutter/cupertino.dart';

class TextOutput extends StatelessWidget {
  final String _mainText;
  
  const TextOutput ({super.key, required String mainText}) : _mainText = mainText ;  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Text(_mainText);
  }
}