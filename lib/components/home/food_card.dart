import 'package:flutter/material.dart';

class foodCard extends StatelessWidget {
  final img;
  final desc;
  const foodCard({super.key, required this.img, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Image.asset(
            img,
            width: 80,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          desc,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
