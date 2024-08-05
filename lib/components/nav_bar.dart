import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  bottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
     selectedIndex: 1,
     color: Colors.black,
     activeColor: Colors.grey.shade700,
     tabActiveBorder: Border.all( color:  Colors.white) ,
     tabBackgroundColor: Colors.grey.shade100,
     tabBorderRadius: 15,
     mainAxisAlignment: MainAxisAlignment.center,
     padding: const EdgeInsets.all(18),
     onTabChange:(value) => onTabChange!(value) ,
     tabs: const [
       GButton(
       icon: Icons.explore,
       text: "Explore",
     ),
       GButton(
       icon: Icons.home,
       text: "Home",
     ),
     GButton(
       icon: Icons.map,
       text: "Map",
     ),
      ]);
  }
}