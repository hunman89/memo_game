import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  final String simbol;
  const BackCard({
    super.key,
    required this.simbol,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
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
