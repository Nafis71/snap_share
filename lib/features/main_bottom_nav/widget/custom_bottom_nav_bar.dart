import 'package:flutter/material.dart';
import 'package:snap_share/core/resources/colors/app_colors.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.mainBottomNavVM,
  });

  final MainBottomNavVM mainBottomNavVM;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.kWhiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavIconSection(
            icon: Icons.home_outlined,
            index: 0,
          ),
          _buildBottomNavIconSection(
            icon: Icons.search,
            index: 1,
          ),
          _buildBottomNavIconSection(
            icon: Icons.add,
            index: 2,
          ),
          _buildBottomNavIconSection(
            icon: Icons.person_outline,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavIconSection({
    required IconData icon,
    required int index,
  }) {
    return InkWell(
      onTap: () => mainBottomNavVM.onChangedIndex(index),
      child: Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          color: mainBottomNavVM.iconBgColor(index),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: mainBottomNavVM.iconColor(index),
          size: 35,
        ),
      ),
    );
  }
}
