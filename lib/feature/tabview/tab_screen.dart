import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        items: _navBarsItems(),
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
    Container(color: Colors.amber),
    Container(color: Colors.amber),
    Container(color: Colors.amber),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.home,
        size: 35.sp,
      ),
      title: ("Home"),
      textStyle: TextStyle(fontSize: 14.sp),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.favorite,
        size: 35.sp,
      ),
      textStyle: TextStyle(fontSize: 14.sp),
      title: ("Favorites"),
      activeColorPrimary: CupertinoColors.destructiveRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.list_alt_outlined,
        size: 35.sp,
      ),
      textStyle: TextStyle(fontSize: 14.sp),
      title: ("Later"),
      activeColorPrimary: CupertinoColors.activeOrange,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.domain_verification_outlined,
        size: 35.sp,
      ),
      textStyle: TextStyle(fontSize: 14.sp),
      title: ("Watched"),
      activeColorPrimary: CupertinoColors.activeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
