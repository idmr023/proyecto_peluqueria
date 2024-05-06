import 'package:PeluqueriaYvette/pages/appointments_page.dart';
import 'package:flutter/material.dart';
import 'package:PeluqueriaYvette/models/shop.dart';
import 'package:PeluqueriaYvette/pages/cart_page.dart';
import 'package:PeluqueriaYvette/pages/intro_page.dart';
import 'package:PeluqueriaYvette/pages/shop_page.dart';
import 'package:PeluqueriaYvette/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override 
    Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: lightMode,
        routes: {
          '/intro_page' : (context) => const IntroPage(),
          '/shop_page' : (context) => const ShopPage(),
          '/cart_page' : (context) => const CartPage(),
          '/appointments_page': (context) => const AppointmentsPage(),
        }
      );
    }
  }
