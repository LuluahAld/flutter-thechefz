import 'package:flutter/material.dart';

class RestOption extends StatelessWidget {
  final text;
  final color;
  final contcolor;

  const RestOption({super.key, required this.text, required this.color, required this.contcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: contcolor,
      ),
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
