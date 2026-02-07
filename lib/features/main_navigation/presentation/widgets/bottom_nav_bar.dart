import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:z_fashion/features/main_navigation/presentation/bloc/bottom_nav_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return Row(
              children: [
                _buildTabItem(
                  selectedIcon: Iconsax.home_2_bold,
                  unSelectedIcon: Iconsax.home_2_outline,
                  itemIndex: 0,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: Iconsax.shopping_bag_bold,
                  unSelectedIcon: Iconsax.shopping_bag_outline,
                  itemIndex: 1,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: Iconsax.heart_bold,
                  unSelectedIcon: Iconsax.heart_outline,
                  itemIndex: 2,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: Iconsax.message_bold,
                  unSelectedIcon: Iconsax.message_outline,
                  itemIndex: 3,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: Iconsax.user_bold,
                  unSelectedIcon: Iconsax.user_outline,
                  itemIndex: 4,
                  currentIndex: selectedIndex,
                  context: context,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required IconData selectedIcon,
    required IconData unSelectedIcon,
    required int itemIndex,
    required int currentIndex,
    required BuildContext context,
  }) {
    final bool isSelected = itemIndex == currentIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _onChanged(context, itemIndex, currentIndex);
        },
        child: Container(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Icon(
                isSelected ? selectedIcon : unSelectedIcon,
                key: ValueKey<bool>(isSelected),
                color: isSelected ? Colors.black : Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onChanged(BuildContext context, int itemIndex, int selectedIndex) {
    context.read<BottomNavCubit>().onTabChanged(itemIndex);
    selectedIndex = context.read<BottomNavCubit>().state;
  }
}
