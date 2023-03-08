import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Order.dart';
import 'package:thechefz/pages/orders/invoice_page.dart';

import '../../models/Meal.dart';

class OrderDetailsPage extends StatelessWidget {
  final Orders order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent(order: order),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const StatusCard(
              text: 'Accepted',
            ),
            const StatusCard(
              text: 'The Chef is cooking your order',
            ),
            const StatusCard(
              text: 'On the way',
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: purple,
                  radius: 16,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Complete',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: purple),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              children: [
                const Icon(
                  Icons.schedule,
                  size: 32,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  order.time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 32,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    order.address,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 70,
              thickness: 1.5,
            ),
            for (var meal in order.meals) ...[
              OrderedMealCard(
                meal: meal,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
            const Divider(
              height: 70,
              thickness: 1.5,
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
                        '${order.subtotal} SAR',
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
                        '${order.subtotal + 20} SAR',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String text;
  const StatusCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: purple,
              radius: 16,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: purple),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 100,
              child: VerticalDivider(
                color: purple,
                thickness: 3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AppBarContent extends StatelessWidget with PreferredSizeWidget {
  const AppBarContent({
    super.key,
    required this.order,
  });

  final Orders order;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Row(
        children: [
          Text(
            'Order ID #${order.id}',
            style: TextStyle(color: textP, fontSize: 20),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InvoicePage()));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 98, 79, 98),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.receipt_long,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text('Invoice'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderedMealCard extends StatelessWidget {
  const OrderedMealCard({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
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
      ],
    );
  }
}
