import 'package:crypto_tracker/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/categoryScreen.dart';
import '../screens/favoritesScreen.dart';
import '../screens/searchScreen.dart';
import '../screens/spotMarketScreen.dart';
import '../screens/trendingScreen.dart';
import 'custom_icons_icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller =
        PersistentTabController(initialIndex: 2);
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens(),
      items: navBarItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0x000a0a0a),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      decoration: const NavBarDecoration(
        // border: Border(
        //   top: BorderSide(
        //     color: Color(0xff0038ff),
        //   ),
        //   bottom: BorderSide(
        //     color: Color(0xff0038ff),
        //   ),
        // ),
        border: primaryGradientBorder,
      ),

      navBarStyle:
          NavBarStyle.style5, // Choose the nav bar style with this property.
    );
  }

  screens() {
    return [
      const TrendingScreen(),
      const SearchScreen(),
      const SpotMarketScreen(),
      const FavouritesScreen(),
      const CategoryScreen(),
    ];
  }

  navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CustomIcons.trending),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        iconSize: 22,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CustomIcons.search),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        iconSize: 22,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(CustomIcons.marketicon),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
        icon: const Icon(CustomIcons.heart_1),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        iconSize: 22,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CustomIcons.categories),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        iconSize: 22,
      ),
    ];
  }
}
