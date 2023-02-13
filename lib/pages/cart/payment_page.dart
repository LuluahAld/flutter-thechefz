import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Meal.dart';
import 'package:thechefz/models/Order.dart';
import 'package:thechefz/pages/home/main_page.dart';

class PaymentPage extends StatefulWidget {
  final Orders ordersnow;
  const PaymentPage({super.key, required this.ordersnow});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final isSelect = [false, false, false];
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Checkout',
          style: TextStyle(color: textP, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pay with',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              for (var loop = 0; loop < isSelect.length; loop++) {
                                isSelect[loop] = false;
                              }
                              isSelect[0] = !isSelect[0];
                              setState(() {});
                            },
                            child: CircleAvatar(
                              backgroundColor: purple,
                              radius: 16,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: isSelect[0] ? purple : Colors.white,
                                  radius: 11,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Apple pay',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'images/apple.png',
                            width: 42,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              for (var loop = 0; loop < isSelect.length; loop++) {
                                isSelect[loop] = false;
                              }
                              isSelect[1] = !isSelect[1];
                              setState(() {});
                            },
                            child: CircleAvatar(
                              backgroundColor: purple,
                              radius: 16,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: isSelect[1] ? purple : Colors.white,
                                  radius: 11,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Credit or Debit Card',
                            style: TextStyle(fontSize: 18),
                          ),
                          Image.asset(
                            'images/cards.png',
                            width: 140,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              for (var loop = 0; loop < isSelect.length; loop++) {
                                isSelect[loop] = false;
                              }
                              isSelect[2] = !isSelect[2];
                              setState(() {});
                            },
                            child: CircleAvatar(
                              backgroundColor: purple,
                              radius: 16,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: isSelect[2] ? purple : Colors.white,
                                  radius: 11,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Wallet (0.0 SAR)',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.account_balance_wallet,
                            color: purple,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Promocode',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Switch.adaptive(
                        value: value,
                        onChanged: (newValue) => setState(() => value = newValue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 226, 227),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Dishes Total: '),
                          Text(
                            '${widget.ordersnow.subtotal} SAR',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Delivery Fee:'),
                          Text(
                            '20 SAR',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 36,
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Order Total'),
                          Text(
                            '${widget.ordersnow.subtotal + 20} SAR',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  child: InkWell(
                    onTap: () {
                      const snackBar = SnackBar(
                        content: Text('Placed order successfully'),
                      );

                      setState(() {});
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const MainPage()), (Route<dynamic> route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      decoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Place Order',
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
                const SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
