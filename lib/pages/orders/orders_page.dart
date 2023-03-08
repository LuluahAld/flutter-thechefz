import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/components/order/order_card.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Meal.dart';
import 'package:thechefz/models/Order.dart';
import 'package:thechefz/models/Restaurant.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/orders/contactus_page.dart';
import 'package:thechefz/pages/orders/order_details_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<bool> isSelect = [false, false];
  final PageController pageController = PageController();
  @override
  void initState() {
    listenToOrders() {
      FirebaseFirestore.instance.collection('order').snapshots().listen(
        (collection) {
          List<Orders> newList = [];
          for (final doc in collection.docs) {
            final restaurant = Orders.fromMap(doc.data());
            newList.add(restaurant);
          }
          orders = newList;
          setState(() {});
        },
      );
    }

    listenToOrders();
    isSelect = [true, false];
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> restnames = [];
    List<String> restimgs = [];

    if (orders.isNotEmpty) {
      for (var j = 0; j < orders.length; j++) {
        for (var i = 0; i < rests.length; i++) {
          if (rests[i].id == orders[j].rest_id) {
            restnames.add(rests[i].name);
            restimgs.add(rests[i].img);
          }
        }
      }
    }
    for (var i = 0; i < restnames.length; i++) {
      print(restnames[0]);
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: const Color.fromARGB(255, 0, 183, 67),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsPage()));
            },
            label: Row(
              children: const [
                Icon(Icons.perm_phone_msg),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 26,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      isSelect.setAll(0, [false, false]);
                      isSelect[0] = !isSelect[0];
                      setState(() {});
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      decoration: BoxDecoration(
                        color: isSelect[0] ? purple : Colors.white,
                        border: Border.all(color: textP),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        'Upcoming',
                        style: TextStyle(fontSize: 24, color: isSelect[0] ? Colors.white : textP),
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
                      setState(() {});
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(42, 10, 42, 10),
                      decoration: BoxDecoration(
                        color: isSelect[1] ? purple : Colors.white,
                        border: Border.all(color: textP),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        'Past',
                        style: TextStyle(fontSize: 24, color: isSelect[1] ? Colors.white : textP),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  allowImplicitScrolling: false,
                  children: [
                    ListView(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        if (orders.isNotEmpty)
                          for (var order in orders) ...[
                            if (order.user_id == userNow[0].id) ...[
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderDetailsPage(
                                                  order: order,
                                                )));
                                  },
                                  child: OrderCard(order: order)),
                              const SizedBox(
                                height: 16,
                              ),
                            ]
                          ]
                      ],
                    ),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listenToOrders() {
    FirebaseFirestore.instance.collection('orders').snapshots().listen(
      (collection) {
        List<Meal> newList = [];
        for (final doc in collection.docs) {
          final restaurant = Meal.fromMap(doc.data());
          newList.add(restaurant);
        }

        // ordersall = newList;
        setState(() {});
      },
    );
  }

  listenToOrdersAll() {
    FirebaseFirestore.instance.collection('ordersall').snapshots().listen(
      (collection) {
        List<Orders> newList = [];
        for (final doc in collection.docs) {
          final restaurant = Orders.fromMap(doc.data());
          newList.add(restaurant);
        }
        orders = newList;
        setState(() {});
      },
    );
  }
}
