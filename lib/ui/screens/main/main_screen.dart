import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = "main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(AppAssets.routeIcon),
            const Spacer(),
            Image.asset(AppAssets.shoppingIcon),
          ],
        ),
      ),
      body: viewModel.tabs[viewModel.currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppColors.primary,
          ),
          child: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: (index) {
              setState(() {
                viewModel.currentTab = index;
              });
            },
            backgroundColor: AppColors.primary,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.homeIcon,
                    color: AppColors.white,
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
                label: "Home",
                activeIcon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Image.asset(
                    AppAssets.homeIcon,
                    color: AppColors.primary,
                    width: 25,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.categoryIcon,
                    color: AppColors.white,
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
                label: "category",
                activeIcon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Image.asset(
                    AppAssets.categoryIcon,
                    color: AppColors.primary,
                    width: 25,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.favIcon,
                    color: AppColors.white,
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
                label: "favourites",
                activeIcon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Image.asset(
                    AppAssets.favIcon,
                    color: AppColors.primary,
                    width: 25,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.userIcon,
                    color: AppColors.white,
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
                label: "user",
                activeIcon: Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Image.asset(
                    AppAssets.userIcon,
                    color: AppColors.primary,
                    width: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}