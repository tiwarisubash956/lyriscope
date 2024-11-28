import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lyriscope/Configuration/routes/app_router.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Presentation/bloc/auth_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(signinwithgoogle: di.sl(),signinwithemailpassword: di.sl()),
        ),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Lyriscope',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          ),
          routerConfig: appRouter.config()),
    );
  }
}
