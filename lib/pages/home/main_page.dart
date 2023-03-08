import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/components/home/home_page.dart';
import 'package:thechefz/models/Address.dart';
import 'package:thechefz/models/Restaurant.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/cart/cart_page.dart';
import 'package:thechefz/pages/orders/orders_page.dart';
import 'package:thechefz/pages/profile/profile_page.dart';

import '../../constants.dart';
import '../../models/Meal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  bool cartVisible = false;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  List<bool> isSelect = [false, false, false, false];

  int currentPage = 0;
  late Timer _timer;
  final PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    for (final res in Addresses) {
      final restaurantCollection = FirebaseFirestore.instance.collection('address');
      final resDoc = restaurantCollection.doc(res.id);
      resDoc.set(res.toMap());
    }

    super.initState();

    listenToCart();
    setState(() {});

    listenToRestaurants();

    isSelect = [true, false, false, false];
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        if (currentPage < 7) {
          currentPage++;
        } else {
          currentPage = 0;
        }

        controller.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget body = const Text('data');

  @override
  Widget build(BuildContext context) {
    int count = 0;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].user_id == userNow[0].id) {
        count++;
        setState(() {});
      }
    }
    bool foundCart = false;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].user_id == userNow[0].id) {
        foundCart = true;
        setState(() {});
      }
    }

    if (foundCart) {
      cartVisible = true;
      setState(() {});
    } else {
      cartVisible = false;
      setState(() {});
    }
    if (currentIndex == 0) {
      body = HomePage(
        controller: controller,
        pageController: pageController,
        isSelect: isSelect,
        onChanged: () {
          // setState(() {});
        },
      );
    } else if (currentIndex == 1) {
      body = const OrdersPage();
      setState(() {});
    } else {
      body = const ProfilePage();
      setState(() {});
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        selectedItemColor: purple,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant,
                size: 28,
              ),
              label: 'Chefz'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_list,
              size: 28,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: 'Profile')
        ],
        currentIndex: currentIndex,
      ),
      body: body,
    );
  }

  listenToRestaurants() {
    FirebaseFirestore.instance.collection('restaurant').snapshots().listen(
      (collection) {
        List<Restaurant> newList = [];
        for (final doc in collection.docs) {
          final restaurant = Restaurant.fromMap(doc.data());
          newList.add(restaurant);
        }

        rests = newList;
        setState(() {});
      },
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
