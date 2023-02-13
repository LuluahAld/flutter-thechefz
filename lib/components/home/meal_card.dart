import 'package:flutter/material.dart';
import 'package:thechefz/components/home/meal_details.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Meal.dart';

class MealCard extends StatefulWidget {
  final Meal meal;
  final Function onChanged;

  const MealCard({super.key, required this.meal, required this.onChanged});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetails(
              meal: widget.meal,
            ),
          ),
        ).then((value) => widget.onChanged());
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.meal.img,
                width: 100,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.meal.name,
                  style: TextStyle(color: textP, fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.meal.rating,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      '(${widget.meal.reviews})',
                      style: const TextStyle(color: Colors.orange),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      'Price : ',
                      style: TextStyle(color: textP),
                    ),
                    Text(
                      '${widget.meal.price} SAR',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
