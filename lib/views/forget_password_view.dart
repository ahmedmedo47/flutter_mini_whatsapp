import 'package:flutter/material.dart';
import 'package:flutter_mini_whatsapp/utils/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class ForgetPasswordView extends ConsumerWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: TColor.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forget Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.text,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        border: InputBorder.none,
                        hintText: 'Email',
                        labelStyle: TextStyle(
                          color: TColor.text,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ButtonStyle(
                      backgroundColor: getColor(Colors.white, TColor.primary),
                      foregroundColor: getColor(TColor.primary, Colors.white),
                      shadowColor: WidgetStateProperty.resolveWith(
                          (states) => TColor.primary),
                      minimumSize: WidgetStateProperty.resolveWith(
                          (states) => const Size(double.maxFinite, 50)),
                      elevation: WidgetStateProperty.resolveWith((states) =>
                          states.contains(WidgetState.pressed) ? 1 : 0),
                      shape: WidgetStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              width: 1,
                              color: states.contains(WidgetState.pressed)
                                  ? Colors.transparent
                                  : TColor.primary),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  WidgetStateProperty<Color> getColor(Color color, Color colorPressed) {
    return WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.pressed) ? colorPressed : color);
  }
}
