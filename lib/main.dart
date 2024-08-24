import 'package:flutter/material.dart';
import 'package:flutter_mini_whatsapp/views/forget_password_view.dart';
import 'package:flutter_mini_whatsapp/views/sign_in.dart';
import 'package:flutter_mini_whatsapp/views/sign_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/forgot_password': (context) => const ForgetPasswordView(),
      },
      debugShowCheckedModeBanner: false,
      home: const SignInPage(),
    );
  }
}
