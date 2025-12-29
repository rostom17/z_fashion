import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_fashion/features/main_navigation/presentation/bloc/bottom_nav_cubit.dart';
import 'package:z_fashion/features/main_navigation/presentation/widgets/bottom_nav_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Widget> _pages = [
    Container(key: ValueKey(0), color: Colors.blue),
    Container(key: ValueKey(1), color: Colors.orange),
    Container(key: ValueKey(2), color: Colors.red),
    Container(key: ValueKey(3), color: Colors.deepPurple),
    Container(key: ValueKey(4), color: Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    //child: FadeTransition(opacity: animation, child: child),
                    child: child,
                  );
                },
                child: _pages[selectedIndex],
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: BottomNavBar(),
              ),
            ],
          ),
          //bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
