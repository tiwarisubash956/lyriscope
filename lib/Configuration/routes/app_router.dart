import 'package:auto_route/auto_route.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Presentation/AdminHomeScreen.dart';
import 'package:lyriscope/Features/Auth/Presentation/Screens/LoginScreen/LoginScreen.dart';
import 'package:lyriscope/Features/Auth/Presentation/Screens/SendPasswordResetEmailScreen/SendPasswordResetEmail.dart';
import 'package:lyriscope/Features/Auth/Presentation/Screens/SignUpScreen/SignUpScreen.dart';
import 'package:lyriscope/Features/Auth/Presentation/Screens/SplashScreen/SplashScreen.dart';
import 'package:lyriscope/Features/HomeScreen/Presentation/BookView.dart';
import 'package:lyriscope/Features/HomeScreen/Presentation/HomeScreen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: SendPasswordResetEmailRoute.page),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(page: BookViewerRoute.page),
        AutoRoute(
          page: AdminHomeRoute.page,
        )
      ];
}
