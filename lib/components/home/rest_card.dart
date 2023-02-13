import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Restaurant.dart';
import 'package:thechefz/pages/home/rest_details.dart';

class RestCard extends StatefulWidget {
  final Function fav;
  final Restaurant restaurant;
  final Function onChanged;
  const RestCard({super.key, required this.restaurant, required this.fav, required this.onChanged});

  @override
  State<RestCard> createState() => _RestCardState();
}

class _RestCardState extends State<RestCard> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    Widget delivery;
    Widget disc;
    if (widget.restaurant.disc == 'yes') {
      disc = Positioned(
        bottom: 40,
        right: 0,
        child: Container(
          padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
          decoration: BoxDecoration(
              color: orange,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              )),
          child: const Text(
            '10% OFF',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      );
    } else {
      disc = const SizedBox();
    }
    if (widget.restaurant.delivery2 == 'yes') {
      delivery = Row(
        children: const [
          Icon(
            Icons.two_wheeler,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Delivery starts from 2 SAR',
            style: TextStyle(color: Colors.redAccent),
          )
        ],
      );
    } else {
      delivery = const SizedBox();
    }
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestDetails(
                      restaurant: widget.restaurant,
                    ))).then((value) => () {
              setState(() {});
            });
      },
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      widget.restaurant.img,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Color.fromARGB(255, 18, 90, 149),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.workspace_premium,
                              color: Colors.white,
                            ),
                            Text(
                              'Promoted',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                        child: InkWell(
                          onTap: () {
                            _pressed();
                            setState(() {});

                            widget.fav();
                          },
                          child: Icon(
                            isPressed ? Icons.favorite : Icons.favorite_border,
                            color: isPressed ? Colors.red : Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: ExactAssetImage(
                          widget.restaurant.imgl,
                        ),
                        backgroundColor: Colors.black,
                        radius: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restaurant.name,
                            style: TextStyle(
                              color: purple.withRed(100),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.place,
                                size: 16,
                              ),
                              Text(widget.restaurant.distance),
                              const SizedBox(
                                width: 16,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                              Text(widget.restaurant.rating),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '(${widget.restaurant.reviews})',
                                style: const TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.restaurant.cat,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          delivery
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          disc
        ],
      ),
    );
  }

  _pressed() {
    bool found = false;
    var newVal = true;
    if (isPressed) {
      newVal = false;
      favRest.remove(widget.restaurant);
      print(favRest.length);
    } else {
      for (var rest in favRest) {
        if (rest.id == widget.restaurant.id) {
          found = true;
        }
      }
      if (!found) {
        favRest.add(widget.restaurant);
      }

      newVal = true;
    }
    setState(() {
      isPressed = newVal;
    });
  }
}
