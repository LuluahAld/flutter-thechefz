import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';

class OrderCardBottom extends StatelessWidget {
  const OrderCardBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Text(
          'Pay Now',
          style: TextStyle(
            fontSize: 20,
            color: textP,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
            height: 40,
            child: VerticalDivider(
              thickness: 2,
              width: 60,
            )),
        Text(
          'Rate',
          style: TextStyle(
            fontSize: 20,
            color: textP,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            thickness: 1,
            width: 60,
          ),
        ),
        Text(
          'Reorder',
          style: TextStyle(
            fontSize: 20,
            color: textP,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
