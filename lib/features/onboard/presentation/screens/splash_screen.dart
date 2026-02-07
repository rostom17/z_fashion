import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:z_fashion/core/theme/app_colors.dart';
import 'package:z_fashion/core/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      context.pushNamed(RouteNames.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                "Z",
                style: GoogleFonts.unifrakturMaguntia(
                  textStyle: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "fashion",
              style: GoogleFonts.unifrakturMaguntia(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
