import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieProgressIndicator extends StatelessWidget {
  final double? width;
  final double? height;
  final String? lottiePath; // Optional: Custom path for the Lottie animation

  const LottieProgressIndicator({
    super.key,
    this.width = 200.0,
    this.height = 200.0,
    this.lottiePath =
        'lib/assets/lottie/Animation3.json', // Default Lottie file
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        backgroundLoading: true,
        repeat: true,
        alignment: AlignmentDirectional.centerStart,
        lottiePath!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
