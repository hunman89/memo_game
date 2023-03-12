import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  final String simbol;
  final Color backgroundColor;

  const BackCard({
    super.key,
    required this.simbol,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: -1,
      child: Container(
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
      ),
    );
  }
}
