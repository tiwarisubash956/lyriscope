import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:lyriscope/Configuration/routes/app_router.dart';
import 'package:lyriscope/Core/Utils/ConstantValue.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> textControllers;
  late List<Animation<double>> fallingTextAnimations;
  final String text = Constantvalue().appName;

  bool showTextAnimation = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();

    // Start Lottie animation and after that, start text animations
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        showTextAnimation = true;
      });
      _startAnimations();
      // ignore: use_build_context_synchronously
    });
  }

  void _initializeAnimations() {
    textControllers = [];
    fallingTextAnimations = [];

    for (int i = 0; i < text.length; i++) {
      AnimationController controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      );
      textControllers.add(controller);

      Animation<double> animation = Tween<double>(begin: -100, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic),
      );
      fallingTextAnimations.add(animation);
    }
  }

  void _startAnimations() {
    for (int i = 0; i < text.length; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        textControllers[i].forward();
      });
    }
    context.router.push(const LoginRoute());
  }

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie Animation
              LottieBuilder.asset(
                frameRate: const FrameRate(20),
                "lib/assets/lottie/Animation2.json",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 30),
              // Display the text animation only after the Lottie animation completes
              if (showTextAnimation)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(text.length, (index) {
                    return AnimatedBuilder(
                      animation: fallingTextAnimations[index],
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, fallingTextAnimations[index].value),
                          child: Text(
                            text[index],
                            style: GoogleFonts.specialElite(
                              fontSize: 40,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
