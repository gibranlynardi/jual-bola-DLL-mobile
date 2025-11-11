import 'package:flutter/material.dart';
import 'package:jual_bola_dll/screens/menu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lime)
        .copyWith(secondary: Colors.limeAccent[400]),
      ),
      home: MyHomePage(),
    );
  }
}

