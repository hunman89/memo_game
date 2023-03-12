import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String simbol;
  final Color backgroundColor;

  const GameCard({
    super.key,
    required this.simbol,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          simbol,
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
