import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(width: 4.0),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
