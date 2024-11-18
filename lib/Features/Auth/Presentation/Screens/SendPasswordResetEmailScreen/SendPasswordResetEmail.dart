import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomElevatedButton.dart';

@RoutePage()


class SendPasswordResetEmailScreen extends StatefulWidget {
  const SendPasswordResetEmailScreen({super.key});

  @override
  State<SendPasswordResetEmailScreen> createState() =>
      _SendPasswordResetEmailScreenState();
}

class _SendPasswordResetEmailScreenState
    extends State<SendPasswordResetEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("lib/assets/images/book.jpg"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Send Link to reset Password at your Registered Email",
            style: GoogleFonts.specialElite(fontSize: 12),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomElevatedButton(onPressed: () {}, label: "Send Email")
        ],
      ),
    );
  }
}
