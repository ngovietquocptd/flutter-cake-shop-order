import 'package:flutter/material.dart';
import 'package:online_ordering_app/checkout.dart';
import 'package:online_ordering_app/detailsScreen.dart';
import 'package:online_ordering_app/favourites.dart';
import 'package:online_ordering_app/homescreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green[700],
      appBarTheme: AppBarTheme(
      color: Colors.green[700],
    ) ,
    elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
          )),
    ),

    debugShowCheckedModeBanner: false,
    routes: {
    //will be used to navigate to any page
      "/":((context) => const Home()),
      "/details":((context) => const Details()),
      "/favourites":(context) => const Favourites(),
      "/checkout":((context) => const Checkout())
    }
  ));
}

