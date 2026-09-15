import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  final void Function(int) onTabChange;

  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() => _selectedIndex = index);
    widget.onTabChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: navigateBottomBar,
        color: Colors.black,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.black,
        gap: 8,
        padding: const EdgeInsets.all(16),
        tabs: const [
          GButton(icon: Icons.storefront, text: 'Catálogo'),
          GButton(icon: Icons.shopping_bag, text: 'Carrito'),
        ],
      ),
    );
  }
}
