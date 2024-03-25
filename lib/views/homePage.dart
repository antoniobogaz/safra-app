import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/historicoPage.dart';
import 'package:flutter_safraapp/views/insumoPage.dart';
import 'package:flutter_safraapp/views/lavouraPage.dart';
import 'package:flutter_safraapp/views/profilePage.dart';
import 'package:flutter_safraapp/widgets/bottom_nav_bar.dart';
import 'package:flutter_safraapp/views/dashboardPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State<homePage> createState() => _homePageState();
}

@override
class _homePageState extends State<homePage> {
  //navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    dashboardPage(),
    lavouraPage(),
    insumoPage(),
    historicoPage(),
    profilePage(),
  ];

  var height, width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
