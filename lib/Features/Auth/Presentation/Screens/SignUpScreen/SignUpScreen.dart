import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lyriscope/Core/Utils/Validation_Function.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomElevatedButton.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomTextFromField.dart';

@RoutePage()


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("lib/assets/images/book.jpg"),
          ),
        ),
        child: Center(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: GoogleFonts.specialElite(fontSize: 30),
                  ),
                  CustomTextField(
                    label: "Email",
                    controller: emailController,
                    validator: validateEmail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    label: "Password",
                    controller: passwordController,
                    validator: validateText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(
                    label: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),

                  // Lottie Animation
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
