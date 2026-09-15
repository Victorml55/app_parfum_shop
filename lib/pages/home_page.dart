import 'package:flutter/material.dart';
import 'package:app_sneaker_shop/components/bottom_nav_bar.dart';
import 'package:app_sneaker_shop/pages/shop_page.dart';
import 'package:app_sneaker_shop/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ShopPage(),
    CartPage(),
  ];

  void navigateBottomBar(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            // encabezado con logo en blanco
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'lib/images/Logo.png',
                  height: 100,
                  color: Colors.white,
                ),
              ),
            ),

            // home
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                navigateBottomBar(0);
              },
            ),

            // about
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),

            const Spacer(),

            // logout
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.of(context)
                    .popUntil((route) => route.isFirst),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(onTabChange: navigateBottomBar),
      body: _pages[_selectedIndex],
    );
  }
}
