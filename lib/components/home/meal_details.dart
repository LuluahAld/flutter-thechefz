import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Meal.dart';
import 'package:thechefz/models/User.dart';

class MealDetails extends StatefulWidget {
  final Meal meal;
  const MealDetails({super.key, required this.meal});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int counter = 1;
  final TextEditingController notesController = TextEditingController();
  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: Image.asset(
                    widget.meal.img,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.meal.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.meal.price} SAR',
                            style: TextStyle(
                              color: textP,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text(widget.meal.rating),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${widget.meal.reviews} Rating',
                                style: const TextStyle(color: Colors.orange),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Text(
                        widget.meal.desc,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${widget.meal.calories} Cal',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 52,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (counter != 1) {
                                    counter--;
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.shade400,
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '$counter',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  counter++;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.shade400,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Add a note',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Optional',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: notesController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.message),
                          hintText: 'Add your notes here (Ex. No Salt)',
                          border: OutlineInputBorder(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: InkWell(
                onTap: () {
                  List<Meal> carttemp = [];
                  for (var i = 0; i < cart.length; i++) {
                    if (cart[i].user_id == userNow[0].id) {
                      carttemp.add(cart[i]);
                    }
                  }
                  if (carttemp.isNotEmpty) {
                    if (cart[0].rest_id != widget.meal.rest_id) {
                      _showAlertDialog(context);
                    } else {
                      Meal mealadded = Meal(
                          id: widget.meal.id,
                          name: widget.meal.name,
                          rating: widget.meal.rating,
                          reviews: widget.meal.reviews,
                          price: widget.meal.price,
                          cat: widget.meal.cat,
                          img: widget.meal.img,
                          rest_id: widget.meal.rest_id,
                          desc: widget.meal.desc,
                          calories: widget.meal.calories,
                          totalM: widget.meal.price * counter,
                          number_of_items: counter,
                          notes: notesController.text,
                          user_id: userNow[0].id);
                      final collection = FirebaseFirestore.instance.collection('cart');
                      collection.doc(mealadded.id).set(mealadded.toMap());
                      setState(() {});
                      Navigator.pop(context);
                    }
                  } else {
                    Meal mealadded = Meal(
                        id: widget.meal.id,
                        name: widget.meal.name,
                        rating: widget.meal.rating,
                        reviews: widget.meal.reviews,
                        price: widget.meal.price,
                        cat: widget.meal.cat,
                        img: widget.meal.img,
                        rest_id: widget.meal.rest_id,
                        desc: widget.meal.desc,
                        calories: widget.meal.calories,
                        totalM: widget.meal.price * counter,
                        number_of_items: counter,
                        notes: notesController.text,
                        user_id: userNow[0].id);
                    final collection = FirebaseFirestore.instance.collection('cart');
                    collection.doc(mealadded.id).set(mealadded.toMap());
                    setState(() {});
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 108, 54, 92),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ADD TO CART',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${widget.meal.price * counter} SAR',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Add dishes from the same chef or delete the previous cart to add this dish'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Dismiss'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              for (final res in cart) {
                final restaurantCollection = FirebaseFirestore.instance.collection('cart');
                final resDoc = restaurantCollection.doc(res.id);
                resDoc.delete();
              }
              Meal mealadded = Meal(
                  id: widget.meal.id,
                  name: widget.meal.name,
                  rating: widget.meal.rating,
                  reviews: widget.meal.reviews,
                  price: widget.meal.price,
                  cat: widget.meal.cat,
                  img: widget.meal.img,
                  rest_id: widget.meal.rest_id,
                  desc: widget.meal.desc,
                  calories: widget.meal.calories,
                  totalM: widget.meal.price * counter,
                  number_of_items: counter,
                  notes: notesController.text,
                  user_id: userNow[0].id);
              final collection = FirebaseFirestore.instance.collection('cart');
              collection.doc(mealadded.id).set(mealadded.toMap());
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pop(context);
            },
            child: const Text('Delete Cart'),
          ),
        ],
      ),
    );
  }
}
