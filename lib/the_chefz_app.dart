import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/models/Address.dart';
import 'package:thechefz/models/Meal.dart';
import 'package:thechefz/models/Restaurant.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/home/main_page.dart';
import 'package:thechefz/pages/location/location_page.dart';
import 'package:thechefz/pages/login/login_page.dart';

class TheChefzApp extends StatefulWidget {
  const TheChefzApp({super.key});

  @override
  State<TheChefzApp> createState() => _TheChefzAppState();
}

bool foundAddress = false;
bool isLoggedIn = false;

class _TheChefzAppState extends State<TheChefzApp> {
  //check if user is logged in

  @override
  void initState() {
    //loading addresses
    listenToAddresses();

    //checking if user has logged in and assigning phone number
    FirebaseAuth.instance.authStateChanges().listen((user) {
      isLoggedIn = user != null;
      if (user != null) {
        userNow.add(Users(phoneNumber: user.phoneNumber, id: user.uid));

        setState(() {});
      }

      setState(() {});
    });

    for (final res in rests) {
      final restaurantCollection = FirebaseFirestore.instance.collection('restaurant');
      final resDoc = restaurantCollection.doc(res.id);
      resDoc.set(res.toMap());
    }
    for (final meal in meals) {
      final mealCollection = FirebaseFirestore.instance.collection('meal');
      final mealDoc = mealCollection.doc(meal.id);
      mealDoc.set(meal.toMap());
    }

    for (final res in cart) {
      final cartCollection = FirebaseFirestore.instance.collection('cart');
      final cartDoc = cartCollection.doc(res.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? Addresses.isNotEmpty
              ? const MainPage()
              : const LocationPage()
          : const LoginPage(),
    );
  }

  listenToAddresses() {
    FirebaseFirestore.instance.collection('address').snapshots().listen(
      (collection) {
        List<Address> newList = [];
        for (final doc in collection.docs) {
          final address = Address.fromMap(doc.data());
          newList.add(address);
        }
        Addresses = newList;

        setState(() {});
      },
    );
  }
}
