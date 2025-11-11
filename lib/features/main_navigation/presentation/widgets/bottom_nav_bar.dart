import 'package:flutter/material.dart';
import 'package:z_fashion/core/constants/asset_constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onChanged() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28, left: 28, right: 28),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            _buildTabItem(
              selectedIcon: AssetConstants.chatFilledIcon,
              unSelectedIcon: AssetConstants.chatIcon,
              itemIndex: 0,
              currentIndex: 0,
              context: context,
            ),
            _buildTabItem(
              selectedIcon: AssetConstants.chatFilledIcon,
              unSelectedIcon: AssetConstants.chatIcon,
              itemIndex: 1,
              currentIndex: 0,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required String selectedIcon,
    required String unSelectedIcon,
    required int itemIndex,
    required int currentIndex,
    required BuildContext context,
  }) {
    final bool isSelected = itemIndex == currentIndex;
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: ImageIcon(AssetImage(unSelectedIcon), color: Colors.white54),
      ),
    );
  }
}
