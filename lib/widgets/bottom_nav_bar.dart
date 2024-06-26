import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 2, 89, 47),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: GNav(
          backgroundColor: Color.fromARGB(255, 2, 89, 47),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Color.fromARGB(255, 8, 46, 28),
          padding: EdgeInsets.all(16),
          gap: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Suas Lavouras',
            ),
            GButton(
              icon: Icons.history_outlined,
              text: 'Suas Aplicações',
            ),
            GButton(
              icon: Icons.person,
              text: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
