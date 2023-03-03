import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bottomNavColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          backgroundColor: bottomNavColor,
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.green.shade200,
          padding: const EdgeInsets.all(16),
          gap: 8,
          iconSize: 25,
          tabs: [
            const GButton(
              icon: EvaIcons.homeOutline,
              iconSize: 30,
              text: 'Home',
            ),
            const GButton(
              icon: EvaIcons.searchOutline,
              iconSize: 30,
              text: 'Search',
            ),
            const GButton(
              icon: EvaIcons.listOutline,
              iconSize: 30,
              text: 'Task List',
            ),
            GButton(
              icon: EvaIcons.plusCircleOutline,
              iconSize: 30,
              text: 'Add',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
