import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Address.dart';
import 'package:thechefz/models/Meal.dart';
import 'package:thechefz/models/Order.dart';
import 'package:thechefz/models/Restaurant.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/cart/payment_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

String time = '';

class _CartPageState extends State<CartPage> {
  String? dateN;

  @override
  void initState() {
    for (final meal in cart) {
      final cartCollection = FirebaseFirestore.instance.collection('cart');
      final cartDoc = cartCollection.doc(meal.id);
      cartDoc.set(meal.toMap());
    }
    listenToCart();

    super.initState();
  }

  List<bool> isSelect = [false, false];
  bool selectedFast = false;
  bool selectedSched = false;

  DateTime now30mins = DateTime.now().add(const Duration(minutes: 30));
  DateTime now45mins = DateTime.now().add(const Duration(minutes: 45));

  @override
  Widget build(BuildContext context) {
    Orders order = Orders(
      subtotal: 0,
      id: '',
      time: time,
      meals: cart,
      rest_id: '',
      rest_img: '',
      rest_name: '',
      address: '',
      user_id: '',
    );

    var subtotal = 0;
    for (var i = 0; i < cart.length; i++) {
      subtotal += cart[i].totalM;
      setState(() {});
    }
    String formattedTime30 = DateFormat.jm().format(now30mins);
    String formattedTime45 = DateFormat.jm().format(now45mins);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: textP, fontSize: 28, fontWeight: FontWeight.w500),
        title: const Text('Cart'),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(12),
            children: [
              const SizedBox(
                height: 20,
              ),
              const GiftCard(),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 3),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: textP,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.location_on,
                              size: 28,
                              color: textP,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentadd.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: textP,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 270,
                              child: Text(
                                currentadd.addressText,
                                maxLines: 3,
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        currentadd.desc,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 3),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'When would you like to recieve your order?',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            isSelect.setAll(0, [false, false]);
                            isSelect[0] = !isSelect[0];

                            selectedFast = true;
                            selectedSched = false;
                            time = 'Delivery will be between $formattedTime30 and $formattedTime45';
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(26, 12, 26, 12),
                            decoration: BoxDecoration(
                              color: isSelect[0] ? purple : Colors.white,
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(color: textP),
                            ),
                            child: Text(
                              'Fastest Time',
                              style: TextStyle(
                                color: isSelect[0] ? Colors.white : textP,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            isSelect.setAll(0, [false, false]);
                            isSelect[1] = !isSelect[1];

                            selectedFast = false;
                            _openDateTimePicker(context);

                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelect[1] ? purple : Colors.white,
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(color: textP),
                            ),
                            child: Text(
                              'Scheduled Time',
                              style: TextStyle(
                                color: isSelect[1] ? Colors.white : textP,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    if (selectedFast)
                      Row(
                        children: [
                          Icon(
                            Icons.motorcycle,
                            size: 32,
                            color: orange,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Delivery will be between $formattedTime30 and $formattedTime45',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: orange),
                          )
                        ],
                      ),
                    if (selectedSched)
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: orange,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Scheduled to arrive at $dateN',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: orange),
                          )
                        ],
                      ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              for (var meal in cart) ...[
                if (userNow[0].id == meal.user_id) ...[
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 3),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                meal.img,
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    meal.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Per dish: ${meal.price} SAR',
                                    style: TextStyle(color: Colors.grey.shade500),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quantity: ${meal.number_of_items}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Total: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '${meal.totalM} SAR',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: textP,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            final collection = FirebaseFirestore.instance.collection('cart');
                            collection.doc(meal.id).delete();

                            setState(() {});
                          },
                          child: Icon(
                            Icons.delete,
                            color: purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
                const SizedBox(
                  height: 16,
                ),
              ],
              const SizedBox(
                height: 120,
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 130,
              width: 430,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '$subtotal SAR',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: InkWell(
                        onTap: () {
                          var id = DateTime.now().millisecondsSinceEpoch.remainder(100000000).toString();

                          for (var i = 0; i < rests.length; i++) {
                            if (cart[0].rest_id == rests[i].id) {
                              order = Orders(
                                  subtotal: subtotal,
                                  id: id,
                                  time: time,
                                  meals: cart,
                                  rest_id: cart[0].rest_id,
                                  rest_img: rests[i].img,
                                  rest_name: rests[i].name,
                                  address: currentadd.addressText,
                                  user_id: userNow[0].id);
                              setState(() {});
                            }
                          }

                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                order: order,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          decoration: BoxDecoration(
                            color: purple,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
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

  void _openDateTimePicker(BuildContext context) {
    BottomPicker.dateTime(
      buttonText: '               OK               ',
      buttonTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      displayButtonIcon: false,
      title: 'Delivery Time',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        selectedSched = true;
        dateN = DateFormat.yMd().add_jm().format(date);
        time = 'Scheduled to arrive at $dateN';
        setState(() {});
      },
      onClose: () {
        selectedSched = false;
        setState(() {});
      },
      iconColor: Colors.black,
      minDateTime: DateTime.now().add(const Duration(minutes: 30)),
      maxDateTime: DateTime.now().add(const Duration(days: 7)),
      initialDateTime: DateTime.now().add(const Duration(minutes: 30)),
      gradientColors: [purple, purple],
    ).show(context);
  }
}

class GiftCard extends StatelessWidget {
  const GiftCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(9)),
      child: Row(
        children: [
          Icon(
            Icons.card_giftcard_outlined,
            size: 50,
            color: orange,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Make it a gift',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(color: orange, borderRadius: BorderRadius.circular(9)),
                    child: const Text(
                      'NEW',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Send this order as a gift to your loved once',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
