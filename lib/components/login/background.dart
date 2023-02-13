import 'package:flutter/material.dart';

class backgroundimg extends StatelessWidget {
  const backgroundimg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/login.png',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
