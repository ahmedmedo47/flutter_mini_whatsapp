import 'package:flutter/material.dart';
import 'package:flutter_mini_whatsapp/utils/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final phoneControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final emailControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final passwordControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final stayLoggedInProvider = StateProvider<bool>((ref) => false);

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameControllerProvider);
    final phoneController = ref.watch(phoneControllerProvider);
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final isStayLogedIn = ref.watch(stayLoggedInProvider);

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
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
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          border: InputBorder.none,
                          hintText: ' Name ',
                          labelStyle: TextStyle(
                            color: TColor.text,
                            fontSize: 15,
                          )),
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
                          hintText: ' Email',
                          labelStyle: TextStyle(
                            color: TColor.text,
                            fontSize: 15,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          border: InputBorder.none,
                          hintText: ' Phone Number',
                          labelStyle: TextStyle(
                            color: TColor.text,
                            fontSize: 15,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          border: InputBorder.none,
                          hintText: 'Password',
                          labelStyle: TextStyle(
                            color: TColor.text,
                            fontSize: 15,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(stayLoggedInProvider.notifier).state =
                              !isStayLogedIn;
                        },
                        icon: Icon(
                          isStayLogedIn
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: isStayLogedIn
                              ? TColor.primary
                              : TColor.subTitle.withOpacity(0.3),
                        ),
                      ),
                      Text(
                        'Keep me logged in',
                        style: TextStyle(
                          color: TColor.subTitle.withOpacity(0.3),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/home');
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
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
