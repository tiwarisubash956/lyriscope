import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lyriscope/Configuration/routes/app_router.dart';
import 'package:lyriscope/Core/Utils/Validation_Function.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomElevatedButton.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomTextFromField.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    "Login",
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
                    label: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont Have Account",
                        style: GoogleFonts.montserrat(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(const SignUpRoute());
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.push(const SendPasswordResetEmailRoute());
                    },
                    child: Text(
                      "Forget Password?",
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  )

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
