import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28, left: 28, right: 28),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
