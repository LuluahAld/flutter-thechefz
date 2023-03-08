import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/components/home/meal_card.dart';
import 'package:thechefz/components/home/menu_cat.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Meal.dart';
import 'package:thechefz/models/Restaurant.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/cart/cart_page.dart';

class RestDetails extends StatefulWidget {
  final Restaurant restaurant;
  const RestDetails({super.key, required this.restaurant});

  @override
  State<RestDetails> createState() => _RestDetailsState();
}

class _RestDetailsState extends State<RestDetails> {
  List<bool> isSelect = [false, false, false, false];
  PageController pageController = PageController();
  bool isPressed = false;
  bool isPressedm = false;
  bool cartVisible = false;

  _pressed() {
    var newVal = true;

    if (isPressed) {
      newVal = false;
    } else {
      newVal = true;
    }
    setState(() {
      isPressed = newVal;
    });
  }

  _pressedm() {
    var newVal = true;

    if (isPressedm) {
      newVal = false;
    } else {
      newVal = true;
    }
    setState(() {
      isPressedm = newVal;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    listenToCart();
    setState(() {});
    listenToMeals() {
      FirebaseFirestore.instance.collection('meal').snapshots().listen(
        (collection) {
          List<Meal> newList = [];
          for (final doc in collection.docs) {
            final meal = Meal.fromMap(doc.data());

            newList.add(meal);
          }

          meals = newList;

          setState(() {});
        },
      );
    }

    listenToMeals();
    isSelect = [true, false, false, false];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool foundCart = false;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].user_id == userNow[0].id) {
        foundCart = true;
        setState(() {});
      }
    }
    Widget promo;
    if (foundCart) {
      cartVisible = true;
      setState(() {});
    } else {
      cartVisible = false;
      setState(() {});
    }
    if (widget.restaurant.delivery2 == 'yes') {
      promo = Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.discount,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Save up to 13 SAR on delivery fees',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Icon(
              Icons.info,
              color: Colors.grey.shade400,
            )
          ],
        ),
      );
    } else {
      promo = const SizedBox();
    }
    int count = 0;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].user_id == userNow[0].id) {
        count++;
        setState(() {});
      }
    }
    return Scaffold(
      floatingActionButton: Visibility(
        visible: cartVisible,
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 140, 97, 133),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
            child: Stack(
              children: [
                const SizedBox(
                  height: 70,
                  width: 70,
                ),
                const Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 40,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 253, 204, 0),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Stack(
            children: [
              Container(color: Colors.white),
              Image.asset(widget.restaurant.img),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 130, 0, 0),
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage(widget.restaurant.imgl),
                  backgroundColor: Colors.white,
                  radius: 40,
                ),
              ),
              InkWell(
                onTap: () {
                  _pressed();
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(380, 180, 0, 0),
                  child: Icon(
                    isPressed ? Icons.favorite : Icons.favorite_border,
                    color: isPressed ? Colors.red : Colors.black,
                    size: 40,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: textP,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.restaurant.cat,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                promo,
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Open ',
                          style: TextStyle(color: Colors.green.shade600, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(widget.restaurant.closing)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.restaurant.rating,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '(${widget.restaurant.reviews})',
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  height: 40,
                  thickness: 1.3,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    padding: const EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          isSelect.setAll(0, [false, false, false, false]);
                          isSelect[0] = !isSelect[0];
                          setState(() {});
                          pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                        },
                        child: MenuCat(
                          desc: widget.restaurant.menu_cat1,
                          div: isSelect[0]
                              ? const Divider(
                                  thickness: 2.5,
                                  color: Color.fromARGB(255, 105, 74, 93),
                                )
                              : const SizedBox(),
                          color: isSelect[0] ? const Color.fromARGB(255, 105, 74, 93) : Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          isSelect.setAll(0, [false, false, false, false]);
                          isSelect[1] = !isSelect[1];
                          setState(() {});
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                        },
                        child: MenuCat(
                          desc: widget.restaurant.menu_cat2,
                          div: isSelect[1]
                              ? const Divider(
                                  thickness: 2.5,
                                  color: Color.fromARGB(255, 105, 74, 93),
                                )
                              : const SizedBox(),
                          color: isSelect[1] ? const Color.fromARGB(255, 105, 74, 93) : Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          isSelect.setAll(0, [false, false, false, false]);
                          isSelect[2] = !isSelect[2];
                          setState(() {});
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                        },
                        child: MenuCat(
                          div: isSelect[2]
                              ? const Divider(
                                  thickness: 2.5,
                                  color: Color.fromARGB(255, 105, 74, 93),
                                )
                              : const SizedBox(),
                          color: isSelect[2] ? const Color.fromARGB(255, 105, 74, 93) : Colors.grey.shade400,
                          desc: widget.restaurant.menu_cat3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListView(
                        padding: const EdgeInsets.all(4),
                        children: [
                          for (var meal in meals) ...[
                            if (widget.restaurant.id == meal.rest_id && meal.cat == widget.restaurant.menu_cat1) ...[
                              MealCard(
                                meal: meal,
                                onChanged: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ]
                          ],
                        ],
                      ),
                      ListView(
                        padding: const EdgeInsets.all(4),
                        children: [
                          for (var meal in meals) ...[
                            if (widget.restaurant.id == meal.rest_id && meal.cat == widget.restaurant.menu_cat2) ...[
                              MealCard(
                                meal: meal,
                                onChanged: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ]
                          ]
                        ],
                      ),
                      ListView(
                        padding: const EdgeInsets.all(4),
                        children: [
                          for (var meal in meals) ...[
                            if (widget.restaurant.id == meal.rest_id && meal.cat == widget.restaurant.menu_cat3) ...[
                              MealCard(
                                meal: meal,
                                onChanged: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ]
                          ]
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  listenToCart() {
    FirebaseFirestore.instance.collection('cart').snapshots().listen(
      (collection) {
        List<Meal> newList = [];
        for (final doc in collection.docs) {
          final restaurant = Meal.fromMap(doc.data());
          newList.add(restaurant);
        }
        cart = newList;
        setState(() {});
      },
    );
  }
}
