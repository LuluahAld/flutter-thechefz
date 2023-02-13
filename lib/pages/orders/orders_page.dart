import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Meal.dart';
import 'package:thechefz/models/Order.dart';
import 'package:thechefz/models/Restaurant.dart';
import 'package:thechefz/pages/orders/contactus_page.dart';

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
    listenToOrders();
    listenToOrdersAll();
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
    List ordertotal = [];
    if (ordersall.isNotEmpty) {
      for (var j = 0; j < ordersall.length; j++) {
        for (var i = 0; i < rests.length; i++) {
          if (rests[i].id == ordersall[j].rest_id) {
            restnames.add(rests[i].name);
            restimgs.add(rests[i].img);
          }
        }
      }
      for (var i = 0; i < orders.length; i++) {
        ordertotal.add(orders[i].subtotal);
      }
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
                        if (ordersall.isNotEmpty)
                          for (var i = 0; i < ordersall.length; i++) ...[
                            Container(
                              width: double.infinity,
                              height: 200,
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.asset(
                                            restimgs[i],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            restnames[i],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            'Accepted',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Order Number: '),
                                              Text(
                                                ordersall[i].order_id,
                                                style: TextStyle(
                                                  color: textP,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              const Icon(
                                                Icons.account_balance_wallet_outlined,
                                              ),
                                              Text(
                                                '${ordertotal[i]} SAR',
                                                style: TextStyle(
                                                  color: textP,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    height: 40,
                                    thickness: 1.5,
                                  ),
                                  const OrderCardBottom()
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            )
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

        ordersall = newList;
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
