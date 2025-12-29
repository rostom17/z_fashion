import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_fashion/core/constants/app_colors.dart';
import 'package:z_fashion/core/constants/asset_constants.dart';
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
                  selectedIcon: AssetConstants.homeFilledIcon,
                  unSelectedIcon: AssetConstants.homeIcon,
                  itemIndex: 0,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: AssetConstants.shoppingBagFilledIocn,
                  unSelectedIcon: AssetConstants.shoppingBagIocn,
                  itemIndex: 1,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: AssetConstants.heartFilledIcon,
                  unSelectedIcon: AssetConstants.heartIcon,
                  itemIndex: 2,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: AssetConstants.chatFilledIcon,
                  unSelectedIcon: AssetConstants.chatIcon,
                  itemIndex: 3,
                  currentIndex: selectedIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: AssetConstants.userFilledIcon,
                  unSelectedIcon: AssetConstants.userIcon,
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
    required String selectedIcon,
    required String unSelectedIcon,
    required int itemIndex,
    required int currentIndex,
    required BuildContext context,
  }) {
    final bool isSelected = itemIndex == currentIndex;
    return Expanded(
      child: InkWell(
        onTap: () {
          _onChanged(context, itemIndex, currentIndex);
        },
        child: isSelected
            ? Container(
                height: 50,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),

                child: Icon(CupertinoIcons.home, size: 20),
                //child: Icon(Icons.person),
              )
            : ImageIcon(AssetImage(unSelectedIcon), color: Colors.white54),
      ),
    );
  }

  void _onChanged(BuildContext context, int itemIndex, int selectedIndex) {
    context.read<BottomNavCubit>().onTabChanged(itemIndex);
    selectedIndex = context.read<BottomNavCubit>().state;
  }
}
