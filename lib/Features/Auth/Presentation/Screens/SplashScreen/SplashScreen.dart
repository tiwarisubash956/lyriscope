// ignore_for_file: file_names

import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomProgressIndicatore.dart';

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
  final String text = constantvalue().appName;
  final String appmototext = constantvalue().appMoto;

  bool showTextAnimation = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();

    // Start Lottie animation, then text animations
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        showTextAnimation = true;
      });
      _startAnimations();
    });
  }

  void _initializeAnimations() {
    textControllers = [];
    fallingTextAnimations = [];

    for (int i = 0; i < text.length; i++) {
      AnimationController controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 0),
      );
      textControllers.add(controller);

      Animation<double> animation = Tween<double>(begin: -100, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic),
      );
      fallingTextAnimations.add(animation);
    }
  }

  void _startAnimations() async {
    for (int i = 0; i < text.length; i++) {
      await Future.delayed(Duration(milliseconds: i * 200), () {
        textControllers[i].forward();
      });
    }
    // Navigate after all animations complete
    // ignore: use_build_context_synchronously
    context.read<AuthBloc>().add(GetCurrentUserEvent());
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
              const Center(child: LottieProgressIndicator());
          }
          if (state is GetCurrentUserState) {
            if (state.user != null) {
              context.router.replace(const HomeRoute());
            } else {
              context.router.replace(const LoginRoute());
            }
          }
        },
        builder: (context, state) {
          
          return Container(
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
                              offset:
                                  Offset(0, fallingTextAnimations[index].value),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    appmototext,
                    style: GoogleFonts.specialElite(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
