import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:z_fashion/core/routes/app_route.dart';
import 'package:z_fashion/core/services/auth_service.dart';


void main() {
  final authService = AuthService();
  final appRouter = AppRoute(authService: authService);
  runApp(ZFashion(authService: authService, router: appRouter.router));
}

class ZFashion extends StatelessWidget {
  final GoRouter router;
  final AuthService authService;

  const ZFashion({required this.router, required this.authService, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
