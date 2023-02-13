import 'package:flutter/material.dart';

class ServiceCat extends StatelessWidget {
  const ServiceCat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Image.asset(
            'images/home/servicecategories/cat1.png',
            width: 120,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Image.asset(
            'images/home/servicecategories/cat2.png',
            width: 120,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Image.asset(
            'images/home/servicecategories/cat3.png',
            width: 120,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Image.asset(
            'images/home/servicecategories/cat4.png',
            width: 120,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
