import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:z_fashion/core/routes/route_names.dart';
import 'package:z_fashion/core/services/auth_service.dart';
import 'package:z_fashion/features/auth/presentation/screens/login_screen.dart';
import 'package:z_fashion/features/main_navigation/presentation/screens/bottom_navigation_screen.dart';
import 'package:z_fashion/features/onboard/presentation/screens/splash_screen.dart';

class AppRoute {
  final AuthService authService;
  AppRoute({required this.authService});

  late final router = GoRouter(
    initialLocation: '/splash',
    refreshListenable: authService,
    debugLogDiagnostics: true,

    redirect: (context, state) {
      // final authStatus = authService.authStatus;
      // final goingToSplash = state.matchedLocation == "/splash";
      // final goingToLogin = state.matchedLocation == "/login";

      // switch (authStatus) {
      //   case AuthStatus.authchecking:
      //     print("i checking");
      //     return goingToSplash ? null : '/splash';
      //   case AuthStatus.unauthenticated:
      //   print("i unauth");
      //     return goingToLogin ? null : '/login';
      //   case AuthStatus.authenticated:
      //   print("i auth");
      //     return (goingToSplash || goingToLogin) ? '/home' : null;
      //   default:
      //     return null;
      // }
    },

    routes: [
      GoRoute(
        path: '/splash',
        name: RouteNames.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.homeScreen,
        builder: (context, state) => BottomNavigationScreen(),
      ),
      GoRoute(
        path: '/login',
        name: RouteNames.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
    ],

    errorBuilder: (context, state) {
      return Scaffold(body: Center(child: Text("Unknown Page")));
    },
  );
}
