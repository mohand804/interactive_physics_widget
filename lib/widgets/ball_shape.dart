import 'package:flutter/material.dart';

class BallShape extends StatelessWidget {
  final Color color;
  final double size;
  const BallShape({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.5),
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
    );
  }
}
