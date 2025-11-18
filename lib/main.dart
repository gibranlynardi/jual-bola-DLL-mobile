import 'package:flutter/material.dart';
import 'package:jual_bola_dll/screens/login.dart'; 
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Jual Bola DLL',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lime)
              .copyWith(secondary: Colors.limeAccent[400]),
          useMaterial3: true,
        ),
        home: const LoginPage(), 
      ),
    );
  }
}