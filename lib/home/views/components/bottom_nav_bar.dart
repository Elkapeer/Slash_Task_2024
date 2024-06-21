import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slash_task/core/constants.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key, required this.tabController, this.onTap});

  final TabController tabController;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        onTap: onTap,
        indicatorColor: darkColor,
        indicator: MaterialIndicator(
          tabPosition: TabPosition.top,
          topLeftRadius: 0,
          topRightRadius: 0,
          bottomLeftRadius: 8,
          bottomRightRadius: 8,
        ),
        labelStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontWeight: boldWeight,
          )
        ),
        unselectedLabelStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontWeight: regularWeight,
          )
        ),
        labelColor: darkColor,
        tabs: [
          Tab(
            icon: Icon(tabController.index == 0?
            CupertinoIcons.house_alt_fill : CupertinoIcons.house_alt),
            text: "Home",
          ),
          Tab(
            icon: Icon(tabController.index == 1?
            CupertinoIcons.heart_fill : CupertinoIcons.heart),
            text: "Favorites",
          ),
          Tab(
            icon: Icon(tabController.index == 2?
            CupertinoIcons.cart_fill : CupertinoIcons.shopping_cart),
            text: "Cart",
          ),
          const Tab( // couldn't find a filled icon lol
            icon: Icon(CupertinoIcons.profile_circled),
            text: "Profile",
          ),
        ]
      ),
    );
  }
}
