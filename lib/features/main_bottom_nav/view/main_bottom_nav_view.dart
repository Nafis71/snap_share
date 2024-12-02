import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/main_bottom_nav/view_model/main_bottom_nav_vm.dart';
import 'package:snap_share/features/main_bottom_nav/widget/custom_bottom_nav_bar.dart';

class MainBottomNavView extends StatefulWidget {
  const MainBottomNavView({super.key});

  @override
  State<MainBottomNavView> createState() => _MainBottomNavViewState();
}

class _MainBottomNavViewState extends State<MainBottomNavView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavVM>(builder: (mainBottomNavVM) {
        return mainBottomNavVM.views[mainBottomNavVM.selectedIndex];
      }),
      bottomNavigationBar: GetBuilder<MainBottomNavVM>(
        builder: (mainBottomNavVM) {
          return CustomBottomNavBar(
            mainBottomNavVM: mainBottomNavVM,
          );
        },
      ),
    );
  }
}
