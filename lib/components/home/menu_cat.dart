import 'package:flutter/material.dart';

class MenuCat extends StatelessWidget {
  final desc;
  final div;
  final color;
  const MenuCat({super.key, required this.desc, required this.div, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          desc,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 22,
          child: div,
        )
      ],
    );
  }
}
