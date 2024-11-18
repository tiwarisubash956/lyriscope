import 'package:flutter/material.dart';
import 'package:lyriscope/Configuration/routes/app_router.dart';
import 'package:lyriscope/Features/Auth/Presentation/Screens/LoginScreen/LoginScreen.dart';
import 'package:lyriscope/Features/Auth/Presentation/Screens/SendPasswordResetEmailScreen/SendPasswordResetEmail.dart';
import 'package:lyriscope/Features/Auth/Presentation/Screens/SplashScreen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: 'Lyriscope',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ));
  }
}
