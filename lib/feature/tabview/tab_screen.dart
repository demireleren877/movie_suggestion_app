import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_application/feature/explore/explore_page.dart';
import 'package:movie_application/feature/profile/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../home/home_screen.dart';

class TabViewScreen extends StatelessWidget {
  TabViewScreen({Key? key}) : super(key: key);

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(context, _controller),
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: 75.h,
        backgroundColor: Colors.blueGrey.shade900,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13,
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const ExploreScreen(),
    Container(color: Colors.amber),
    const ProfileScreen()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems(
    BuildContext context, PersistentTabController controller) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.home,
        size: 35.sp,
      ),
      inactiveIcon: Icon(
        Icons.home_outlined,
        size: 35.sp,
      ),
      title: ("Home"),
      textStyle: TextStyle(fontSize: 14.sp),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.explore,
        size: 35.sp,
      ),
      inactiveIcon: Icon(
        Icons.explore_outlined,
        size: 35.sp,
      ),
      textStyle: TextStyle(fontSize: 14.sp),
      title: ("Explore"),
      activeColorPrimary: CupertinoColors.activeOrange,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.favorite,
        size: 35.sp,
      ),
      inactiveIcon: Icon(
        Icons.favorite_outline,
        size: 35.sp,
      ),
      textStyle: TextStyle(fontSize: 14.sp),
      title: ("Later"),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.person,
        size: 35.sp,
      ),
      inactiveIcon: Icon(
        Icons.person_outline,
        size: 35.sp,
      ),
      textStyle: TextStyle(fontSize: 14.sp),
      title: ("Settings"),
      activeColorPrimary: CupertinoColors.activeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
