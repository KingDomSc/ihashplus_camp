import 'package:flutter/material.dart';
import 'package:task03/screens/create/create_screen.dart';
import 'package:task03/screens/details/detail_screen.dart';
import 'package:task03/screens/layout/layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      builder: (context, child) =>
          Directionality(textDirection: .rtl, child: child!),
      routes: {
        "/": (context) => LayoutScreen(),
        "/create": (context) => CreateScreen(),
        "/details": (context) => DetailScreen(),
      },
    );
  }
}
