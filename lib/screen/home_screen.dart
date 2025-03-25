import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:eksplora/screen/my_home_screen.dart';
import 'package:eksplora/screen/cart_screen.dart';
import 'package:eksplora/screen/profile_screen.dart';
import 'package:eksplora/constant/constant.dart';
import 'package:eksplora/screen/history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    MyHomeScreen(),
    CartScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: primaryColor,
            gap: 15,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: const [
              GButton(icon: Icons.home, text: 'Beranda'),
              GButton(icon: Icons.shopping_cart, text: 'Keranjang'),
              GButton(icon: Icons.archive_sharp, text: 'Riwayat'),
              GButton(icon: Icons.person, text: 'Akun Saya'),
            ],
          ),
        ),
      ),
    );
  }
}
