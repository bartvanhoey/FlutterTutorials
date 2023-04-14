import 'package:flutter/material.dart';
import 'package:roll_dice_app/dice_roller.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
   const GradientContainer({super.key, required this.colors});

   const GradientContainer.purple({super.key})
      : colors = const [
          Color.fromARGB(255, 24, 6, 52),
          Color.fromARGB(255, 115, 91, 151)
        ];

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors, begin: beginAlignment, end: endAlignment),
      ),
      child: const Center(
        child: DiceRoller() ,
      ),
    );
  }
}
